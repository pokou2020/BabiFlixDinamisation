import 'package:baby_flix/babiflix/screen/Liste_Animes.dart';
import 'package:baby_flix/babiflix/screen/Liste_Films.dart';
import 'package:baby_flix/babiflix/screen/Liste_Novelas.dart';
import 'package:baby_flix/babiflix/screen/Liste_Serie.dart';
import 'package:baby_flix/babiflix/screen/MoadifModepass.dart';
import 'package:baby_flix/babiflix/screen/detailserie.dart';
import 'package:baby_flix/babiflix/screen/movieDetail.dart';
import 'package:baby_flix/babiflix/screen/suggession.dart';
import 'package:baby_flix/babiflix/widget/VoirPlus.dart';
import 'package:baby_flix/babiflix/widget/acceuillWid.dart';
import 'package:baby_flix/babiflix/widget/drawer.dart';
import 'package:baby_flix/babiflix/widget/splashscreen.dart';
import 'package:baby_flix/babiflix/widget/teve.dart';
import 'package:provider/provider.dart';
import 'babiflix/screen/Accueil1.dart';
import 'babiflix/screen/Chaine.dart';

import 'babiflix/screen/afrik.dart';
import 'babiflix/screen/film.dart';
import 'babiflix/screen/loginView.dart';
import 'babiflix/screen/modifProfile.dart';
import 'babiflix/screen/novelas.dart';
import 'babiflix/screen/parametr.dart';
import 'babiflix/screen/profile.dart';
import 'babiflix/screen/profile1.dart';
import 'babiflix/screen/profile2.dart';
import 'babiflix/screen/radio.dart';
import 'babiflix/screen/serie.dart';
import 'babiflix/screen/tele.dart';
import 'package:flutter/material.dart';
import 'babiflix/screen/acceuil.dart';
import 'babiflix/screen/connexion.dart';
import 'babiflix/screen/inscription.dart';
import 'babiflix/screen/youtbe.dart';
import 'babiflix/widget/detailTele.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            unselectedWidgetColor: Colors.white,
            primarySwatch: Colors.red,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen(),
          routes: {
            'inscrip': (context) => Inscription(),
            'connex': (context) => Connexion(),
            "inscr": (context) => Acceuil1(),
            "connec": (context) => Acceuil1(),
            "teve": (context) => Tele(),
            // "Liste_films_Action": (context) => ListefilmsAction(),
            "seri": (context) => SerieCate(),
            "ytb": (context) => Youtbe(),
            "radio": (context) => RadioCate(),
            "afr": (context) => Afrik(),
            "nov": (context) => Novelas(),
            "par": (context) => Parametr(),
            "compt": (ctx) => Profil(),
            "sinops": (context) => Film(),
            "VoirPlus": (context) => VoirPlus(),
            "drawer": (context) => Drawers(),
            'Accueil1': (context) => Acceuil1(),
            "suggession": (context) => Suggession(),
            'movieDetail': (context) => Film(),
            'teleDetail': (context) => DetailTele(),
            //"radio":(context)=>RadioCate(),
            "Chaine": (context) => Chaine(),
            "profil": (context) => Profile2(),
            "Liste_Serie": (context) => ListeSerie(),
            "Liste_Films": (context) => Listefilms(),
            "Liste_Animes": (context) => ListeAnimes(),
            "Liste_Novelas": (context) => ListeNovelas(),
            "detailserie": (context) => DetailSerie(),
            "modifProfile": (context) => ModiProfile(),
            "MoadifModepass": (context) => MoadifModepass()
          }),
    );
  }
}