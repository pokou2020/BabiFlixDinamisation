import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'model/user.dart';

class RepositoryUser {
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TheUser _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

//  auth change user stream
  Stream<TheUser> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  DatabaseReference database =
      FirebaseDatabase.instance.reference().child("Users");

  Future<void> registerUser({String email, String password, String nom}) {
    _auth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((result) {
      print(
          "////////////////// CREATE USER SUCCEFULY ////////////////////////");

      database.child(result.user.uid).set({
        "email": email,
        "name": nom,
        "password": password,
      }).then((res) {
        print(
            "////////////////// CREATE USER IN DATABASE SUCCEFULY ////////////////////////");
      });
    }).catchError((err) {
      print("////////////////// ERROR ////////////////////////");
      print(err);
    });
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
