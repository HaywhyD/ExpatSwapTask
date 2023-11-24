// import 'dart:io';
// import 'package:flutter/foundation.dart';

// /// provider for the authentication states
// class AuthProvider extends ChangeNotifier {
//   bool _isLoggedIn = false;
//   String _userToken = '';
//   String _userId = '';

//   final Details _details = Details();
//   LocalDatabase _database = LocalDatabase.instance;

//   bool get isLoggedIn => _isLoggedIn;
//   String get userToken => _userToken;
//   String get userId => _userId;

//   /// login user
//   Future<void> login({required String email, required String password}) async {
//     try {
//       final auth = Authentication();
//       final response = await auth.signIn(email, password);
//       if (response != null) {
//         _details.email = response.email;
//         _details.isLoggedIn = true;
//         _details.password = password;
//         _details.userId = response.id;
//         _details.credits = response.credits;
//         _details.token = response.cookie.toString().split(';')[0];
//         _details.name = response.name.toString().replaceAll('_', ' ');
//         _isLoggedIn = _details.isLoggedIn!;
//         _userToken = _details.token!;
//         final getData = await _database.fetchDetails();
//         if (getData.isEmpty) {
//           await _database.insertDetails(_details);

//           notifyListeners();
//         } else {
//           if (getData[0]['email'] != email) {
//             await _database.deleteTable();
//             _database = LocalDatabase.instance;
//             await _database.insertDetails(_details);

//             notifyListeners();
//           } else {
//             await _database.updateDetails(_details);

//             notifyListeners();
//           }
//         }

//         _userToken = _details.token!;
//         _userId = _details.userId!;
//         notifyListeners();
//       } else {
//         // Authentication failed
//         throw Exception(
//             "Authentication failed. Check your email and password.");
//       }
//     } catch (e) {
//       if (e is SocketException) {
//         throw Exception(
//             "Network error. Please check your internet connection.");
//       } else if (e is ApiException) {
//       } else {
//         // Handle other unexpected errors

//         throw Exception("An unexpected error occurred.");
//       }
//     }
//     notifyListeners();
//   }

//   Future<void> signUp({
//     required String email,
//     required String name,
//     required String password,
//   }) async {
//     try {
//       final auth = Authentication();
//       final response = await auth.signUp(
//         email,
//         name,
//         password,
//       );

//       if (response != null) {
//         _isLoggedIn = true;
//         // Authentication failed
//       } else {
//         throw Exception("SignUp failed. Check your email and password.");
//       }
//     } catch (e) {
//       if (e is SocketException) {
//         throw Exception(
//             "Network error. Please check your internet connection.");
//       } else if (e is ApiException) {
//       } else {
//         // Handle other unexpected errors

//         throw Exception("An unexpected error occurred.");
//       }
//     }
//     notifyListeners();
//   }

//   Future<void> logout({
//     required String email,
//   }) async {
//     try {
//       final auth = Authentication();
//       final response = await auth.logout(
//         email,
//       );

//       if (response != null) {
//         _isLoggedIn = false;
//         await _database.updateColumn('loggedIn', 'false');

//         // logout failed
//       } else {
//         throw Exception("Logout failed");
//       }
//     } catch (e) {
//       if (e is SocketException) {
//         throw Exception(
//             "Network error. Please check your internet connection.");
//       } else if (e is ApiException) {
//       } else {
//         // Handle other unexpected errors

//         throw Exception("An unexpected error occurred.");
//       }
//     }
//     notifyListeners();
//   }
// }
