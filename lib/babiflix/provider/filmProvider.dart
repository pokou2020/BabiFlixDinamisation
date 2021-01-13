import 'package:baby_flix/babiflix/provider/model/filmModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FilmProvider with ChangeNotifier {
  
  List<Film> _films = [];
  List<Film> get films => this._films;

  Future<void> getAllFilm() async {
    final url = "https://babiflixdinamisation-default-rtdb.firebaseio.com/film.json";
    try {
      final result = await http.get(url);
      print("Get info from provider");
      print(result.body);
      print(result.statusCode);
      if(result.statusCode == 200){
        final fetchData = json.decode(result.body) as Map<String,dynamic>;
        List<Film> all = [];
      fetchData.forEach((key, value) {  
        Film newFilm = Film.fromMap(value);
        newFilm.id = key;
        all.add(newFilm);
        print("Nouveau add ${newFilm.toMap()}");
      });
      _films = all;
      notifyListeners();
      }
      
      
    } catch (e) {
      print("Error to get info from provider ${e.toString()}");
      
    }
  }
}