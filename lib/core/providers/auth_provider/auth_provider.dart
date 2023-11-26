import 'dart:async';
import 'dart:io';
import 'package:expatswap_task/core/model/account_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/database/database.dart';

/// provider for the authentication states
class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _userId = '';
  bool _isLoading = false;
  bool _isEmailVerified = false;
  AccountDetails _details = AccountDetails();
  bool get isLoggedIn => _isLoggedIn;
  String get userId => _userId;
  AccountDetails get details => _details;
  bool get isLoading => _isLoading;
  bool get isEmailVerified => _isEmailVerified;
  String _email = '';
  String get email => _email;
  String _profilePic = '';
  String get profilePic => _profilePic;

  /// login user
  Future<bool> login({required String email, required String password}) async {
    _isLoading = true;
    notifyListeners();
    try {
      final LocalDatabase database = LocalDatabase.instance;
      final auth = FirebaseAuth.instance;
      final response = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.user != null) {
        _details.email = response.user!.email;
        _details.isLoggedIn = true;
        _details.userId = response.user!.uid;
        _details.fullName = response.user!.displayName;
        _details.address = _details.address ?? 'address';
        _details.dateOfBirth = _details.dateOfBirth ?? 'date of Birth';
        _details.phoneNumber = _details.phoneNumber ?? 'phone Number';
        _details.isVerified = response.user!.emailVerified;
        _isEmailVerified = response.user!.emailVerified;
        _isLoggedIn = true;
        _userId = response.user!.uid;
        _email = response.user!.email ?? '';
        _profilePic = response.user!.photoURL ?? '';
        final getData = await database.fetchAccountDetails();
        if (getData.isEmpty) {
          await database.insertAccountDetails(_details);
        } else {
          await database.updateAccountDetails(_details);
        }
      }
      _isLoading = false;
      notifyListeners();
      if (auth.currentUser!.emailVerified) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      if (e is SocketException) {
        throw Exception(
            "Network error. Please check your internet connection.");
      } else if (e is FirebaseAuthException) {
        throw Exception(e.message);
      } else {
        // Handle other unexpected errors

        throw Exception("An unexpected error occurred.");
      }
    }
  }

  Future<bool> loginWithGoogle() async {
    _isLoading = true;
    notifyListeners();
    try {
      final LocalDatabase database = LocalDatabase.instance;
      final auth = FirebaseAuth.instance;
      final googleUser =
          await GoogleSignIn(signInOption: SignInOption.standard).signIn();

      final googleAuth = await googleUser?.authentication;

      if (googleAuth != null) {
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the UserCredential

        final response = await auth.signInWithCredential(credential);
        if (response.user != null) {
          _details.email = response.user!.email;
          _details.isLoggedIn = true;
          _details.userId = response.user!.uid;
          _details.fullName = response.user!.displayName ?? 'full Name';
          _details.address = _details.address ?? 'address';
          _details.dateOfBirth = _details.dateOfBirth ?? 'date of Birth';
          _details.phoneNumber = _details.phoneNumber ?? 'phone Number';
          _details.isVerified = response.user!.emailVerified;
          _isEmailVerified = response.user!.emailVerified;
          _isLoggedIn = true;
          _userId = response.user!.uid;
          _email = response.user!.email ?? '';
          _profilePic = response.user!.photoURL ?? '';
          final getData = await database.fetchAccountDetails();
          if (getData.isEmpty) {
            await database.insertAccountDetails(_details);
          } else {
            await database.updateAccountDetails(_details);
          }
        }
      }

      _isLoading = false;
      notifyListeners();
      if (auth.currentUser!.emailVerified) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      if (e is SocketException) {
        throw Exception(
            "Network error. Please check your internet connection.");
      } else if (e is FirebaseAuthException) {
        throw Exception(e.message);
      } else {
        // Handle other unexpected errors

        throw Exception("An unexpected error occurred.");
      }
    }
  }

  Future<void> signUp({
    required String email,
    required String fullName,
    required String password,
    required String phoneNumber,
    required String address,
    required String dateOfBirth,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final LocalDatabase database = LocalDatabase.instance;
      final auth = FirebaseAuth.instance;
      final response = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (response.user != null) {
        await response.user!.updateDisplayName(fullName);
        _details.email = response.user!.email;
        _details.isLoggedIn = false;
        _details.userId = response.user!.uid;
        _details.fullName = fullName;
        _details.address = address;
        _details.dateOfBirth = dateOfBirth;
        _details.phoneNumber = phoneNumber;
        _details.isVerified = false;
        _isLoggedIn = false;
        _profilePic = response.user!.photoURL ?? '';
        _email = response.user!.email ?? '';
        final getData = await database.fetchAccountDetails();
        if (getData.isEmpty) {
          await database.insertAccountDetails(_details);
        } else {
          await database.updateAccountDetails(_details);
        }

        // Authentication failed
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      if (e is SocketException) {
        throw Exception(
            "Network error. Please check your internet connection.");
      } else if (e is FirebaseAuthException) {
        throw Exception(e.message);
      } else {
        // Handle other unexpected errors

        throw Exception("An unexpected error occurred.");
      }
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> logout() async {
    try {
      final LocalDatabase database = LocalDatabase.instance;
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser!;
      _details.email = user.email;
      _details.isLoggedIn = false;
      _details.userId = user.uid;
      _details.fullName = user.displayName;
      _details.address = _details.address;
      _details.dateOfBirth = _details.dateOfBirth;
      _details.phoneNumber = _details.phoneNumber;
      _details.isVerified = _details.isVerified;
      final getData = await database.fetchAccountDetails();
      if (getData.isNotEmpty) {
        await database.updateAccountDetails(_details);
      }
      await auth.signOut();
      notifyListeners();
      return true;
    } catch (e) {
      if (e is SocketException) {
        throw Exception(
            "Network error. Please check your internet connection.");
      } else if (e is FirebaseAuthException) {
        throw Exception(e.message);
      } else {
        // Handle other unexpected errors

        throw Exception("An unexpected error occurred.");
      }
    }
  }

  Future<bool> deleteAccount() async {
    try {
      final LocalDatabase database = LocalDatabase.instance;
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser!;
      await user.delete();
      await auth.signOut();
      _details.email = user.email;
      _details.isLoggedIn = false;
      _details.userId = user.uid;
      _details.fullName = user.displayName;
      _details.address = _details.address;
      _details.dateOfBirth = _details.dateOfBirth;
      _details.phoneNumber = _details.phoneNumber;
      _details.isVerified = false;
      final getData = await database.fetchAccountDetails();
      if (getData.isNotEmpty) {
        await database.updateAccountDetails(_details);
      }
      notifyListeners();
      return true;
    } catch (e) {
      if (e is SocketException) {
        throw Exception(
            "Network error. Please check your internet connection.");
      } else if (e is FirebaseAuthException) {
        throw Exception(e.message);
      } else {
        // Handle other unexpected errors

        throw Exception("An unexpected error occurred.");
      }
    }
  }

  Future<bool> resetPassword({
    required String email,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      final auth = FirebaseAuth.instance;
      await auth.sendPasswordResetEmail(email: email);
      _isLoading = false;

      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      if (e is SocketException) {
        throw Exception(
            "Network error. Please check your internet connection.");
      } else if (e is FirebaseAuthException) {
        throw Exception(e.message);
      } else {
        // Handle other unexpected errors

        throw Exception("An unexpected error occurred.");
      }
    }
  }

  Future<void> verifyEmail({
    required String email,
  }) async {
    try {
      final LocalDatabase database = LocalDatabase.instance;
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser!;
      await user.sendEmailVerification();
      Timer.periodic(const Duration(seconds: 5), (timer) async {
        final newAuth = FirebaseAuth.instance;
        final newUser = newAuth.currentUser!;
        await newUser.reload();
        if (newUser.emailVerified) {
          timer.cancel();
          _isEmailVerified = true;
        }
      });
      _details.email = user.email;
      _details.isLoggedIn = true;
      _details.userId = user.uid;
      _details.fullName = user.displayName ?? 'full Name';
      _details.address = _details.address ?? 'address';
      _details.dateOfBirth = _details.dateOfBirth ?? 'date of Birth';
      _details.phoneNumber = _details.phoneNumber ?? 'phone Number';
      _details.isVerified = user.emailVerified;
      _isEmailVerified = user.emailVerified;
      _isLoggedIn = true;
      final getData = await database.fetchAccountDetails();
      if (getData.isEmpty) {
        await database.insertAccountDetails(_details);
      } else {
        await database.updateAccountDetails(_details);
      }
      notifyListeners();
    } catch (e) {
      if (e is SocketException) {
        throw Exception(
            "Network error. Please check your internet connection.");
      } else if (e is FirebaseAuthException) {
        throw Exception(e.message);
      } else {
        // Handle other unexpected errors

        throw Exception("An unexpected error occurred.");
      }
    }
  }

  Future<void> editProfile({
    required String fullName,
    required String phoneNumber,
    required String address,
    required String dateOfBirth,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      final LocalDatabase database = LocalDatabase.instance;
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser!;
      await user.updateDisplayName(fullName);
      _details.email = user.email;
      _details.isLoggedIn = true;
      _details.userId = user.uid;
      _details.fullName = fullName;
      _details.address = address;
      _details.dateOfBirth = dateOfBirth;
      _details.phoneNumber = phoneNumber;
      _details.isVerified = true;
      final getData = await database.fetchAccountDetails();
      if (getData.isNotEmpty) {
        await database.updateAccountDetails(_details);
      }
      _isLoading = false;

      notifyListeners();
    } catch (e) {
      _isLoading = false;

      notifyListeners();
      if (e is SocketException) {
        throw Exception(
            "Network error. Please check your internet connection.");
      } else if (e is FirebaseAuthException) {
        throw Exception(e.message);
      } else {
        // Handle other unexpected errors

        throw Exception("An unexpected error occurred.");
      }
    }
  }

  updateDetails(AccountDetails details) {
    _details = details;
    notifyListeners();
  }
}
