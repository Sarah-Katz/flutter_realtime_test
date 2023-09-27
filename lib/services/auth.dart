import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  // Register user function
  static Future<String> registerUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return "OK";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  // Login user function
  static Future<String> loginUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "OK";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  // Logout user function
  static void logoutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
