import 'package:baby_flix/babiflix/provider/model/filmModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FilmProvider with ChangeNotifier {
  
  List<Film> _film = [];
  List<Film> get films => this._film;

  Future<void> getAllFilm() async {
    final url = "https://babiflixdinamisation-default-rtdb.firebaseio.com/film.json";
    try {
      final result = await http.get(url);
      print("Get info from provider");
      print(result);
    } catch (e) {
      print("Error to get info from provider ${e.toString()}");
      
    }
  }
}