import 'dart:ui';
import 'package:baby_flix/babiflix/provider/fiserbaService.dart';
import 'package:baby_flix/babiflix/screen/inscription.dart';
import 'package:baby_flix/babiflix/widget/baseAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Drawers extends StatefulWidget {
  Drawers({Key key, this.auth, this.userId, this.logoutCallback, this.user})
      : super(key: key);

  FirebaseUser user;
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
//  signOut() async {
//     try {
//       await widget.auth.signOut();
//       widget.logoutCallback();
//     } catch (e) {
//       print(e);
//     }
//   }
  final RepositoryUser _auth = RepositoryUser();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipPath(
        child: Container(
          width: 240,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.5)),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("profil");
                      },
                      child: Center(
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                        ),
                      ),
                    ),
                    Center(
                        child: Container(
                      child: Text("Lepnkouakou@gmail.com",
                          //  (widget.user.email != null)
                          //   ? Text(widget.userId)
                          //   : Text(widget.user.email,

                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.white,
                      endIndent: 80,
                      indent: 80,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "Nan.ci",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ListTile(
                      title: Text(
                        "Mes Favoris",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      leading: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.star,
                          color: Colors.red,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Mes telechargement",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      leading: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.download,
                          color: Colors.red,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    ListTile(
                      title: Container(
                        child: Row(
                          children: [
                            Text(
                              "Abonnement",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      leading: IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.moneyBill,
                          color: Colors.red,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Paramettre",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      leading: IconButton(
                          icon: Icon(
                            Icons.settings,
                            size: 20,
                            color: Colors.red,
                          ),
                          onPressed: () {}),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("radio");
                      },
                      child: ListTile(
                        title: Text(
                          "Radio",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        leading: IconButton(
                            icon: Icon(
                              Icons.radio,
                              size: 20,
                              color: Colors.red,
                            ),
                            onPressed: () {}),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("teve");
                      },
                      child: ListTile(
                        title: Text(
                          "TV",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        leading: IconButton(
                            icon: Icon(
                              Icons.tv,
                              size: 20,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed("teve");
                            }),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Partager un amis",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      leading: IconButton(
                          icon: Icon(
                            Icons.person_add,
                            size: 20,
                            color: Colors.red,
                          ),
                          onPressed: () {}),
                    ),
                    InkWell(
                      //      onTap: (){

                      //   Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      //     builder: (BuildContext context) => Inscription()))  ;                       },

                      onTap: () async {
                        await _auth.signOut();
                      },
                      child: ListTile(
                        title: Text(
                          "Deconexion",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        leading: IconButton(
                            icon: Icon(
                              Icons.power_settings_new,
                              size: 20,
                              color: Colors.red,
                            ),
                            onPressed: () {}),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "A propos",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      leading: IconButton(
                          icon: Icon(
                            Icons.inbox,
                            size: 20,
                            color: Colors.red,
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
