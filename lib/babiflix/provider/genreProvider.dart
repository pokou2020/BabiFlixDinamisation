import 'package:baby_flix/babiflix/provider/model/genreModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenreProvider with ChangeNotifier {
  List<Genre> _genre = [];
  List<Genre> get genre => this._genre;

  Future<void> getAllGenre() async {
    final url =
        "https://babiflixdinamisation-default-rtdb.firebaseio.com/genre.json";
    try {
      final resul = await http.get(url);
      if (resul.statusCode == 200) {
        final fetchData = json.decode(resul.body) as Map<String, dynamic>;
        List<Genre> all = [];
        fetchData.forEach((key, value) {
          Genre mesGenre = Genre.fromMap(value);
          mesGenre.id = key;
          all.add(mesGenre);
        });
        _genre = all;
        notifyListeners();
      }
    } catch (e) {
      print("Error to get info from provider ${e.toString()}");
    }
  }

  // var genreTitre = Genre().titre;

  // List<Film> getgenreFlim() {
  //   try {
  //     return _films
  //         .where((element) => element.genreFilm.titre == genreTitre)
  //         .toList();
  //   } catch (e) {
  //     print("Error to get info from provider ${e.toString()}");
  //   }
  // }
}
