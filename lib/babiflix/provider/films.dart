import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'film.dart';

class Movies with ChangeNotifier {
  List<Films> _filmList = [];

  List<Films> get filmList {
    return [..._filmList];
  }

  Future<void> fetchAndSetFilms() async {
    const url =
        'https://babiflixdinamisation-default-rtdb.firebaseio.com/film.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print("Patrick $extractedData");
      if (extractedData == null) {
        return;
      }
      final List<Films> loadedFilm = [];
      extractedData.forEach((filmId, filmData) {
        loadedFilm.add(Films(
          id: filmId,
          titre: filmData['titre'],
          descrip: filmData['descrip'],
          image: filmData['image'],
          realisateur: filmData['realisateur'],
          genre: filmData['genre'],
          dateDeSortie: filmData['dateDeSortie'],
          isFilm: filmData['isFilm'],
          saison: filmData['saison'],
          status: filmData['statu'],
          numeroEpisode: filmData['numeroEpisode'],
          urlFilm: filmData['urlFilm'],
        ));
      });
      _filmList = loadedFilm;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
