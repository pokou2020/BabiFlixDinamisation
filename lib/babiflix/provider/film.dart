import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Film with ChangeNotifier {
  final String id;
  final String titre;
  final String descrip;
  final String image;
  final String realisateur;
  final String genre;
  final DateTime dateDeSortie;
  bool isFilm;
  final List saison;
  bool status;
  final int numeroEpisode;
  final String urlFilm;
  Film({
    @required this.id,
    @required this.titre,
    @required this.descrip,
    @required this.image,
    @required this.realisateur,
    @required this.genre,
    @required this.dateDeSortie,
    @required this.saison,
    this.isFilm = true,
    this.status = false,
    @required this.numeroEpisode,
    @required this.urlFilm,
  });

  void _setFavValue(bool newValue) {
    isFilm = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus() async {
    final oldStatus = isFilm;
    isFilm = !isFilm;
    notifyListeners();

    final url = 'https://sydney-apps-projet.firebaseio.com/products/$id.json';
    try {
      final response = await http.patch(
        url,
        body: json.encode({'isFilm': isFilm}),
      );

      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (error) {
      _setFavValue(oldStatus);
    }
  }
}
