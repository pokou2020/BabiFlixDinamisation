import 'package:baby_flix/babiflix/widget/FormSign.dart';
import 'package:baby_flix/babiflix/widget/authBtn.dart';
import 'package:baby_flix/babiflix/widget/itemLog.dart';
import 'package:flutter/material.dart';

import '../widget/formLog.dart';
import '../widget/inputAuth.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  bool _val = true;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: deviceHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bcg.jpg'), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                tileMode: TileMode.clamp,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.black.withOpacity(0.8),
                  Colors.black,
                ]),
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
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InputLogin('Nom ou pseudo'),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InputLogin('E-mail'),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 30),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 1.2,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mot de pass",
                                contentPadding: EdgeInsets.only(left: 10),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: deviceWidth / 20),
                      ],
                    ),
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
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('Accueil1');
                          // _inputDialog(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 35),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text("S'incrire",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
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
    );
  }
}
