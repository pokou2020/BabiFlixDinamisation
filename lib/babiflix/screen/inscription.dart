import 'package:baby_flix/babiflix/provider/fiserbaService.dart';
import 'package:baby_flix/babiflix/screen/Accueil1.dart';
import 'package:baby_flix/babiflix/widget/FormSign.dart';
import 'package:baby_flix/babiflix/widget/authBtn.dart';
import 'package:baby_flix/babiflix/widget/itemLog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../widget/formLog.dart';
import '../widget/inputAuth.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  bool _val = true;
  bool isLoading = false;
 
  final _formKey = GlobalKey<FormState>();

  RepositoryUser _repositoryUser = RepositoryUser();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // @override
  // void initState() {

  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bcg.jpg'), fit: BoxFit.cover),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              height: deviceHeight,
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
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed("inscription");
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
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
                                      'Inscription',
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 50),
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
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Nom ou pseudo",
                                  contentPadding: EdgeInsets.only(left: 10),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Veuillez remplir le champ nom';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 30),
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 30),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
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
                              ),
                              SizedBox(width: deviceWidth / 20),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 100),
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
                                          "j'accepte les conditions d'utilisation de babiflix",
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 50),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: isLoading
                              ? CircularProgressIndicator()
                              : InkWell(
                                  onTap: () async {
                                    print(
                                        "/////////////////////////// FORMS VALID ////////////////////////////////////");

                                    print(_formKey.currentState.validate());

                                    if (_formKey.currentState.validate()) {
                                      await _repositoryUser.registerUser(
                                          email: emailController.text,
                                          nom: nameController.text,
                                          password: passwordController.text);

                                      setState(() {
                                        isLoading = true;
                                      });
                                      // registerToFb();
                                      print(
                                          "///////////////////////////////////////////////////////////////");
                                      print(
                                          "///////////////////////////////////////////////////////////////");
                                      print(
                                          "///////////////////////////////////////////////////////////////");

                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Acceuil1()),
                                      );
                                    }
                                  },
                                  child: Center(child: Text("s'inscrire")),
                                ),
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
                        Container(
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
                      ],
                    ),
                    SizedBox(height: deviceHeight / 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
