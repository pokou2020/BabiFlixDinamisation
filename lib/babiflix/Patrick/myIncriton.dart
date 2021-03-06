import 'package:baby_flix/babiflix/provider/fiserbaService.dart';
import 'package:baby_flix/babiflix/screen/Accueil1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyInscription extends StatefulWidget {
  MyInscription({Key key}) : super(key: key);

  @override
  _MyInscriptionState createState() => _MyInscriptionState();
}

class _MyInscriptionState extends State<MyInscription> {
   bool toggle = false;
   bool couleur=true;
 bool isLoading = false;
  bool _val = true;
  bool _loginMode = true;
  final _formKey = GlobalKey<FormState>();
  
  RepositoryUser _repositoryUser = RepositoryUser();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confpasswordController=TextEditingController();
  
 

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
              child: Container(
                 height: deviceHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Top rows
                   SizedBox(
                     height: 70,
                   ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              setState(() {
                                 couleur=true;
                                toggle=false;
                              });
                            },
                            child:  Text(
                              "Connexion",
                              style: TextStyle(
                              color: Colors.white
                            ),
                            ) ,
                            color: (couleur==true)? Theme.of(context).primaryColor:Colors.transparent,
                          ),

                          RaisedButton(
                            onPressed: () {
                              setState(() {
                                  toggle=true;
                                  couleur=false;
                              });
                            },
                            child:  Text("Inscription",
                            style: TextStyle(
                              color: Colors.white
                            ),
                            ),
                            elevation: _loginMode ? 20 : 00,
                            color: (couleur==false)?Theme.of(context).primaryColor:Colors.transparent,
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
                             
                                    (toggle==true)?    Row(
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
                                      controller: _nameController,
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
                              ):Container(
                          child: Text(""),
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
                                controller: _emailController,
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
                            ),
                           
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
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Mot de pass",
                                      contentPadding: EdgeInsets.only(left: 10),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    validator:  (value) {
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
                            height: MediaQuery.of(context).size.height / 30),
                      (toggle==true)?  Container(
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
                                    controller: _confpasswordController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Conf Mot de pass",
                                      contentPadding: EdgeInsets.only(left: 10),
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Entrez le mot de passe';
                                      } else if (value !=_passwordController.text) {
                                        return 'Mot de passe different';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(width: deviceWidth / 20),
                            ],
                          ),
                        ):Container(
                          child: Text(""),
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


                       (toggle==true)? Container(
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
                                          email: _emailController.text,
                                          nom: _nameController.text,
                                          password: _passwordController.text);

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
                                  child: Center(child: Text("S'inscrire",
                                  style: TextStyle(
                              color: Colors.white
                            ),
                                  )),
                                ),
                        ):  Container(
                         height: 50,
                         width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red
                        
                        ),
                        child: isLoading
                            ? Center(child: CircularProgressIndicator())
                            : InkWell(
                                onTap: () {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    logInToFb();
                                  }
                                },
                                child: Center(child: Text('Se connecter',
                                      style: TextStyle(
                              color: Colors.white
                            ),
                                )),
                              ),
                      ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            )
            );
  }
  
  void logInToFb() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((result) {
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
              title: Text("Error"),
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
