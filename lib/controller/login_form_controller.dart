import 'package:review_system/constants/global_constants.dart';
import 'package:review_system/controller/db_controller.dart';
import 'package:review_system/models/form_models/login_form_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';
import 'package:review_system/models/user_models/user.dart';

class LoginFormController {
  FirebaseApp firebaseApp;

  auth.FirebaseAuth _auth;

  LoginFormController() {
    _initializeFirebase();
  }
  _initializeFirebase() async {
    this.firebaseApp = await Firebase.initializeApp();
    this._auth = auth.FirebaseAuth.instance;
  }

  Future<bool> loginUser(LoginFormData _loginForm) async {
    try {
      //first login
      FirebaseApp firebaseApp = await Firebase.initializeApp();
      final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

      try {
        final auth.UserCredential userCred =
            (await _auth.signInWithEmailAndPassword(
          email: _loginForm.email,
          password: _loginForm.password,
        ));
        Get.snackbar("Login", "Logged In Succesfully");
        userGloabal = await Database.getUserDetails(userId: userCred.user.uid);
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
        final auth.UserCredential userCred =
            (await _auth.createUserWithEmailAndPassword(
          email: _loginForm.email,
          password: _loginForm.password,
        ));
        Get.snackbar("Register", "Registered Succesfully");
        //store in firestore
        userGloabal = User(email: _loginForm.email, userId: userCred.user.uid);
        await Database.addUser(user: userGloabal);
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
