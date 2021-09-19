import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:review_system/models/user_models/user.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _usersCollection = _firestore.collection('users');
final CollectionReference _reviewsCollection = _firestore.collection('reviews');

class Database {
  // static String userUid;

  static Future<void> addUser({@required User user}) async {
    DocumentReference documentReferencer = _usersCollection.doc(user.userId);

    await documentReferencer
        .set(user.toJson())
        .whenComplete(() => print("User added to the database"))
        .catchError((e) => print(e));
  }

  static Future<User> getUserDetails({@required String userId}) async {
    DocumentSnapshot snapShot = await _usersCollection.doc(userId).get();
    User _user = User.fromJson(snapShot.data());
    return _user;
  }

  
}
