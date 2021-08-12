import 'package:review_system/models/form_models/login_form_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';

class LoginFormController {
  FirebaseApp firebaseApp;
  FirebaseAuth _auth;

  LoginFormController() {
    _initializeFirebase();
  }
  _initializeFirebase() async {
    this.firebaseApp = await Firebase.initializeApp();
    this._auth = FirebaseAuth.instance;
  }

  Future<bool> loginUser(LoginFormData _loginForm) async {
    try {
      //first login
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      final FirebaseAuth _auth = FirebaseAuth.instance;

      try {
        final UserCredential userCred = (await _auth.signInWithEmailAndPassword(
          email: _loginForm.email,
          password: _loginForm.password,
        ));
        Get.snackbar("Login", "Logged In Succesfully");
        return true;
      } catch (e) {
        switch (e.code) {
          case 'user-not-found':
            return (await registerUser(_loginForm));
            break;
          default:
            Get.snackbar("Login", "Some error happened: ${e.code}");
            return false;
        }
      }

      // user = userCred.user;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> registerUser(LoginFormData _loginForm) async {
    try {
      try {
        final UserCredential userCred =
            (await _auth.createUserWithEmailAndPassword(
          email: _loginForm.email,
          password: _loginForm.password,
        ));
        Get.snackbar("Register", "Registered Succesfully");

        return true;
      } catch (e) {
        Get.snackbar("Register", "Some error happened: ${e.code}");
        return false;
      }
      // user = userCred.user;
    } catch (e) {
      print(e.code);
      return false;
    }
  }
}
