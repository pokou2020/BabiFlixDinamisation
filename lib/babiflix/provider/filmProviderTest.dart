import 'package:baby_flix/babiflix/provider/model/filmModel.dart';
import 'package:baby_flix/babiflix/provider/model/genreModel.dart';
import 'package:baby_flix/babiflix/provider/model/serieModel.dart';
import 'package:baby_flix/babiflix/widget/africa.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

import 'model/filmModelTest.dart';

class FilmProviderTest with ChangeNotifier {
  List<Filmtest> _filmsTest = [
    Filmtest(
      id: "f1",
      genreId: "G1",
      titre: "Harry Potter 1",
      image: "images/film2.jpg",
      realisateur: "Lesyde",
      personnage: "Nath",
      description: "aventure fantastique",
      dateSortie: "12/01/21",
      urlFilm: "",
      status: false,
    ),
    Filmtest(
      id: "f2",
      genreId: "G1",
      titre: "Avengers",
      image: "images/film3.jpg",
      realisateur: "Lesyde",
      personnage: "Nath",
      description: "aventure fantastique",
      dateSortie: "12/01/21",
      urlFilm: "",
      status: false,
    ),
    Filmtest(
      id: "f3",
      genreId: "G2",
      titre: "John wick 1",
      image: "images/film4.jpg",
      realisateur: "Lesyde",
      personnage: "Nath",
      description: "action il tue les elements en tas",
      dateSortie: "12/01/21",
      urlFilm: "",
      status: false,
    ),
    Filmtest(
      id: "f4",
      genreId: "G2",
      titre: "The expandable",
      image: "images/film1.jpg",
      realisateur: "Lesyde",
      personnage: "Nath",
      description: "Ya les rambos , les bruce willis dedans",
      dateSortie: "12/01/21",
      urlFilm: "",
      status: false,
    ),
  ];
  List<Filmtest> get filmsTest => this._filmsTest;

//permet de filtrer Les genre de film
  // List<Filmtest> getgenreFlimAfrique() {
  //   try {
  //     return _filmsTest
  //         .where((element) => element.genreFilm.titre == "Afrique")
  //         .toList();
  //   } catch (e) {
  //     print("Error to get info from provider ${e.toString()}");
  //   }
  // }

  // List<Film> getgenreFlimAComique() {
  //   try {
  //     return _films
  //         .where((element) => element.genreFilm.titre == "Comique")
  //         .toList();
  //   } catch (e) {
  //     print("Error to get info from provider ${e.toString()}");
  //   }
  // }

  // // permet de convertir les chaines de caratere en Datime et d'afficher les  films les  plus recent
  // List<Film> filmRecent() {
  //   //List<Film> _films = [];
  //   List<DateTime> sortieFilm = [];
  //   DateFormat format = DateFormat("yyyy-MM-dd HH:mm:ss");

  //   for (int i = 0; i < films.length; i++) {
  //     sortieFilm.add(format.parse(_films[i].dateSortie));
  //   }

  //   sortieFilm.sort((key, value) {
  //     var now = DateTime.now();
  //     //before -> var adate = a.expiry;
  //     //var bdate =  "10/04/2021";//before -> var bdate = b.expiry;
  //     return now.compareTo(
  //         value); //to get the order other way just switch `adate & bdate`
  //   });
  //   for (int i = 0; i < sortieFilm.length; i++) {
  //     print(
  //         "///////////////////////////////////////${films[i].dateSortie}//////////////////////////////////////");
  //   }
  // }

  // Future<void> getAllFilm() async {
  //   final url =
  //       "https://babiflixdinamisation-default-rtdb.firebaseio.com/film.json";
  //   try {
  //     final result = await http.get(url);
  //     print("Get info from provider");
  //     print(result.body);
  //     print(result.statusCode);
  //     if (result.statusCode == 200) {
  //       final fetchData = json.decode(result.body) as Map<String, dynamic>;
  //       List<Film> all = [];
  //       fetchData.forEach((key, value) {
  //         Film newFilm = Film.fromMap(value);
  //         newFilm.id = key;
  //         all.add(newFilm);
  //         print(
  //             "////////////////Nouveau add ${newFilm.toMap()}//////////////////////////");
  //       });
  //       _films = all;
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     print("Error to get info from provider ${e.toString()}");
  //   }
  // }
}
