import 'dart:convert';

import 'package:baby_flix/babiflix/screen/film.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Films with ChangeNotifier {
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
  Films({
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
}
