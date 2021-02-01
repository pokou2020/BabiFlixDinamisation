import 'package:flutter/material.dart';

class MyInscription extends StatefulWidget {
  MyInscription({Key key}) : super(key: key);

  @override
  _MyInscriptionState createState() => _MyInscriptionState();
}

class _MyInscriptionState extends State<MyInscription> {
  bool _loginMode = true;
  final _formKey = GlobalKey<FormState>();
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Top rows
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              _loginMode = !_loginMode;
                            });
                          },
                          child: Text("Connexion"),
                          elevation: _loginMode ? 20 : 00,
                          color: Theme.of(context).primaryColor,
                        ),
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              _loginMode = !_loginMode;
                            });
                          },
                          child: Text("Inscription"),
                          elevation: _loginMode ? 20 : 00,
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                  // Form main
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
