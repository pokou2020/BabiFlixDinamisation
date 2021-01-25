import 'package:baby_flix/babiflix/provider/model/filmModel.dart';
import 'package:baby_flix/babiflix/provider/model/genreModel.dart';
import 'package:baby_flix/babiflix/provider/model/serieModel.dart';
import 'package:baby_flix/babiflix/widget/africa.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class FilmProvider with ChangeNotifier {
  List<Film> _films = [];
  List<Film> get films => this._films;

//permet de filtrer Les genre de film
  List<Film> getgenreFlimAfrique() {
    try {
      return _films
          .where((element) => element.genreId == "-MQwYiYyBZhNOPyR1Jcq")
          .toList();
    } catch (e) {
      print("Error to get info from provider ${e.toString()}");
    }
  }

  List<Film> getgenreFlimAComique() {
    try {
      return _films
          .where((element) => element.genreId == "-MQwYclIHzWlUARNkvpJ")
          .toList();
    } catch (e) {
      print("Error to get info from provider ${e.toString()}");
    }
  }

  // permet de convertir les chaines de caratere en Datime et d'afficher les  films les  plus recent
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

  Future<void> getAllFilm() async {
    final url =
        "https://babiflixdinamisation-default-rtdb.firebaseio.com/film.json";
    try {
      final result = await http.get(url);
      print("Get info from provider");
      print(result.body);
      print(result.statusCode);
      if (result.statusCode == 200) {
        final fetchData = json.decode(result.body) as Map<String, dynamic>;
        List<Film> all = [];
        fetchData.forEach((key, value) {
          Film newFilm = Film.fromMap(value);
          newFilm.id = key;
          all.add(newFilm);
          print(
              "////////////////Nouveau add ${newFilm.toMap()}//////////////////////////");
        });
        _films = all;
        notifyListeners();
      }
    } catch (e) {
      print("Error to get info from provider ${e.toString()}");
    }
  }
}
