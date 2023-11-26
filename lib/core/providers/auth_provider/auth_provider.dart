import 'dart:async';
import 'dart:io';
import 'package:expatswap_task/core/model/account_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../data/database/database.dart';

/// provider for the authentication states
class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _userId = '';
  bool _isLoading = false;
  bool _isEmailVerified = false;
  AccountDetails _details = AccountDetails();
  final LocalDatabase _database = LocalDatabase.instance;
  bool get isLoggedIn => _isLoggedIn;
  String get userId => _userId;
  AccountDetails get details => _details;
  bool get isLoading => _isLoading;
  bool get isEmailVerified => _isEmailVerified;
  String _email = '';
  String get email => _email;

  /// login user
  Future<bool> login({required String email, required String password}) async {
    _isLoading = true;
    notifyListeners();
    try {
      final auth = FirebaseAuth.instance;
      final response = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.user != null) {
        _details.email = response.user!.email;
        _details.isLoggedIn = true;
        _details.password = password;
        _details.userId = response.user!.uid;
        _details.fullName = response.user!.displayName;
        _details.address = '4, surulere Street';
        _details.dateOfBirth = '2023-11-12';
        _details.phoneNumber = '09036727573';
        _details.isVerified = response.user!.emailVerified;
        _isEmailVerified = response.user!.emailVerified;
        _isLoggedIn = true;
        _userId = response.user!.uid;
        _email = response.user!.email ?? '';
        final getData = await _database.fetchAccountDetails();
        if (getData.isEmpty) {
          await _database.insertAccountDetails(_details);
        } else {
          if (getData[0]['email'] != email) {
            await _database.deleteTable();

            await _database.insertAccountDetails(_details);
          } else {
            await _database.updateAccountDetails(_details);
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
      print(e);
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
      final auth = FirebaseAuth.instance;
      final response = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (response.user != null) {
        await response.user!.updateDisplayName(fullName);
        _details.email = response.user!.email;
        _details.isLoggedIn = false;
        _details.password = password;
        _details.userId = response.user!.uid;
        _details.fullName = fullName;
        _details.address = address;
        _details.dateOfBirth = dateOfBirth;
        _details.phoneNumber = phoneNumber;
        _details.isVerified = false;
        _isLoggedIn = false;

        _email = response.user!.email ?? '';
        final getData = await _database.fetchAccountDetails();
        if (getData.isEmpty) {
          await _database.insertAccountDetails(_details);
        } else {
          if (getData[0]['email'] != email) {
            await _database.deleteTable();

            await _database.insertAccountDetails(_details);
          } else {
            await _database.updateAccountDetails(_details);
          }
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
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser!;
      _details.email = user.email;
      _details.isLoggedIn = false;
      _details.password = _details.password;
      _details.userId = user.uid;
      _details.fullName = user.displayName;
      _details.address = _details.address;
      _details.dateOfBirth = _details.dateOfBirth;
      _details.phoneNumber = _details.phoneNumber;
      _details.isVerified = false;
      final getData = await _database.fetchAccountDetails();
      if (getData.isNotEmpty) {
        await _database.updateAccountDetails(_details);
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

  Future<bool> resetPassword({
    required String email,
  }) async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.sendPasswordResetEmail(email: email);

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

  Future<void> verifyEmail({
    required String email,
  }) async {
    try {
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser!;
      await auth.currentUser!.sendEmailVerification();
      Timer.periodic(const Duration(seconds: 4), (timer) async {
        await user.reload();
        if (user.emailVerified) {
          timer.cancel();
          _isEmailVerified = true;
        }
      });
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
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser!;
      await user.updateDisplayName(fullName);
      _details.email = user.email;
      _details.isLoggedIn = true;
      _details.password = _details.password;
      _details.userId = user.uid;
      _details.fullName = fullName;
      _details.address = address;
      _details.dateOfBirth = dateOfBirth;
      _details.phoneNumber = phoneNumber;
      _details.isVerified = true;
      final getData = await _database.fetchAccountDetails();
      if (getData.isNotEmpty) {
        await _database.updateAccountDetails(_details);
      }
      _isLoading = false;

      notifyListeners();
    } catch (e) {
      print(e);
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
