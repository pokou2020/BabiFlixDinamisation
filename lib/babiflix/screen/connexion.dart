import 'package:baby_flix/babiflix/screen/Accueil1.dart';
import 'package:baby_flix/babiflix/widget/FormSign.dart';
import 'package:baby_flix/babiflix/widget/authBtn.dart';
import 'package:baby_flix/babiflix/widget/itemLog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widget/formLog.dart';
import '../widget/inputAuth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _val = true;
  bool isLoading = false;
  bool _busy = false;
  FirebaseUser _user;

   final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: deviceHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/bcg.jpg'), fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //     tileMode: TileMode.clamp,
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: [
                //       Colors.white.withOpacity(0.1),
                //       Colors.black.withOpacity(0.8),
                //       Colors.black,
                //     ]),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    'connexion',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                )),
                            InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "Inscription",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).size.height / 9),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 1.2,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Email",
              contentPadding: EdgeInsets.only(left: 10),
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
               validator: (value) {
                        if (value.isEmpty) {
                          return 'Veuillez entrez votre mot de passe';
                        } else if (!value.contains('@')) {
                          return 'Svp entrez un mail valide';
                        }
                        return null;
                      },
          ),
        )
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                                   Container(
                                     height: 50,
                                     width: MediaQuery.of(context).size.width / 1.2,
                                     alignment: Alignment.center,
                                     decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(15)),
                                     child: TextFormField(
                                       controller: passwordController,
                                       decoration: InputDecoration(
                                         border: InputBorder.none,
                                         hintText: "Mot de pass",
                                         contentPadding: EdgeInsets.only(left: 10),
                                         hintStyle: TextStyle(
                                           color: Colors.grey,
                                         ),
                                       ),
                                           validator: (value) {
                        if (value.isEmpty) {
                          return 'Entrez le mot de passe';
                        } else if (value.length < 6) {
                          return 'Votre mot de passe doit contenir au moins 6 caractere';
                        }
                        return null;
                      },
                                     ),
                                   ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  activeColor: Colors.white,
                                  checkColor: Colors.black,
                                  autofocus: false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this._val = value;
                                    });
                                  },
                                  value: this._val,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    child: FittedBox(
                                      child: Text(
                                        "Rester connecté",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    child: FittedBox(
                                      child: Text(
                                        "Mot de passe oublié",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                         height: 50,
                         width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                         color: Colors.red
                        ),
                        child: isLoading
                            ? CircularProgressIndicator()
                            : InkWell(
                                onTap: () {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    logInToFb();
                                  }
                                },
                                child: Center(child: Text('Se connecter')),
                              ),
                      ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 0.2,
                        width: deviceWidth / 1.5,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: deviceHeight / 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Ou avec',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ],
                  ),
                  SizedBox(height: deviceHeight / 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 80,
                        padding: EdgeInsets.only(top: 10, bottom: 5),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(59, 89, 152, 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image(
                          image: AssetImage('images/pa.png'),
                        ),
                      ),
                      SizedBox(width: deviceWidth / 20),
                      InkWell(
                      onTap: this._busy
              ? null
              : () async {
                  try {
                    setState(() => this._busy = true);
                    final user = await this._googleSignIn();
                    this._showUserProfilePage(user);
                  } catch (e) {
                    setState(() => this._busy = false);
                  }
                },
                        child: Container(
                          height: 40,
                          width: 80,
                          padding: EdgeInsets.only(top: 10, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Image(
                            image: AssetImage('images/gle.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: deviceHeight / 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
    Future<FirebaseUser> _googleSignIn() async {
    final curUser = this._user ?? await FirebaseAuth.instance.currentUser();
    if (curUser != null && !curUser.isAnonymous) {
      return curUser;
    }

    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Note: user.providerData[0].photoUrl == googleUser.photoUrl.

    // FirebaseAuth.instance.currentUser();

    final user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
//    kFirebaseAnalytics.logLogin();
    setState(() => this._user = user);

    return user;
  }
    void _showUserProfilePage(FirebaseUser user, {FirebaseAuth users}) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => Acceuil1(
                uid: user.email,
              )),
    );
  }
    void logInToFb() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
          print("///////////////////////////////${result.user}//////////////////////////");
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Acceuil1(uid: result.user.uid)),
      );
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Sa passe pas"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
}
