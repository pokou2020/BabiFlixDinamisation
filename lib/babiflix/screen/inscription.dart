import 'package:baby_flix/babiflix/provider/fiserbaService.dart';
import 'package:baby_flix/babiflix/screen/Accueil1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Inscription extends StatefulWidget {
   
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  bool _checkBoxVal = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

   RepositoryUser _repositoryUser = RepositoryUser();
  
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
  
    @override
    void initState() {
     Firebase.initializeApp();
  
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 850,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/accueil.jpeg"), fit: BoxFit.cover),
            ),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 120),
                  Text(
                    "Inscription",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Nom",
                              hintStyle: TextStyle(color: Colors.black26),
                               enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                      ),
                      
                            ),
                            validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez remplir le champ nom';
                      }
                      return null;
                    },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Mot de passe",
                              hintStyle: TextStyle(color: Colors.black26),
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Confirmer mot de passe",
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                            validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez entrez le meme mot de passe';
                      }
                      return null;
                    },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Adresse Email",
                              hintStyle: TextStyle(color: Colors.black26),
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              child: Checkbox(
                                checkColor: Colors.black,
                                activeColor: Colors.white,
                                onChanged: (bool value) {
                                  setState(() => this._checkBoxVal = value);
                                },
                                value: this._checkBoxVal,
                              ),
                              height: 17,
                              width: 17,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 320,
                            child: Text(
                              "Veuillez accepter les termes d'utilisation afin de valider votre inscription",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                         
                          onTap: () async{
                          print("/////////////////////////// FORMS VALID ////////////////////////////////////");


                            print(_formKey.currentState.validate());


                            if (_formKey.currentState.validate()) {
                               await _repositoryUser.registerUser(email: emailController.text, nom: nameController.text, password: passwordController.text);
  
                              setState(() {
                                isLoading = true;
                              })
                              ;
                              // registerToFb();
                              print("///////////////////////////////////////////////////////////////");
                              print("///////////////////////////////////////////////////////////////");
                              print("///////////////////////////////////////////////////////////////");

                                Navigator.pushReplacement(
                        context,MaterialPageRoute(builder: (context) => Acceuil1()),);
                            }
                            
                          

                          },
                          child: Center(child: Text("S'inscrire")),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'connex');
                        },
                        child: Container(
                          child: Text(
                            "Avez vous deja un compte ? Connectez-vous",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
