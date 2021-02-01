import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RepositoryUser {
  bool isLoading = false;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference database =
      FirebaseDatabase.instance.reference().child("Users");

  Future<void> registerUser({String email, String password, String nom}) {
    firebaseAuth
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
}
