import 'package:baby_flix/babiflix/Patrick/myIncriton.dart';
import 'package:baby_flix/babiflix/provider/model/user.dart';
import 'package:baby_flix/babiflix/screen/Accueil1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    print(user);
    // return either home or authentificate widget

    if (user == null) {
      return MyInscription();
    } else {
      return Acceuil1();
    }
  }
}
