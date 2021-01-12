import 'package:flutter/material.dart';

import 'film.dart';

class Movies with ChangeNotifier {
  List<Films> _filmList = [];
  void addFilm(Films film) {
    final newFilm = Films(
      id: DateTime.now().toString(),
      titre: film.titre,
      descrip: film.descrip,
      image: film.image,
      realisateur: film.realisateur,
      genre: film.genre,
      dateDeSortie: film.dateDeSortie,
      saison: film.saison,
      numeroEpisode: film.numeroEpisode,
      urlFilm: film.urlFilm,
    );
    _filmList.add(newFilm);
    notifyListeners();
  }
}
