// To parse this JSON data, do
//
//     final film = filmFromMap(jsonString);

import 'dart:convert';

Film filmFromMap(String str) => Film.fromMap(json.decode(str));

String filmToMap(Film data) => json.encode(data.toMap());

class Film {
  Film({
    this.id,
    this.titre,
    this.descrition,
    this.image,
    this.realisateur,
    this.genreMovie,
    this.isFilm,
    this.dateSortie,
    this.urlMovie,
    this.numeroEpisode,
    this.nomSerie,
    this.numeroSaison,
    this.casting,
  });

  String id;
  String titre;
  String descrition;
  String image;
  String realisateur;
  GenreMovie genreMovie;
  bool isFilm;
  String dateSortie;
  String urlMovie;
  int numeroEpisode;
  String nomSerie;
  int numeroSaison;
  String casting;

  factory Film.fromMap(Map<String, dynamic> json) => Film(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        descrition: json["descrition"] == null ? null : json["descrition"],
        image: json["image"] == null ? null : json["image"],
        realisateur: json["realisateur"] == null ? null : json["realisateur"],
        genreMovie: json["genreMovie"] == null
            ? null
            : GenreMovie.fromMap(json["genreMovie"]),
        isFilm: json["isFilm"] == null ? null : json["isFilm"],
        dateSortie: json["dateSortie"] == null ? null : json["dateSortie"],
        urlMovie: json["urlMovie"] == null ? null : json["urlMovie"],
        numeroEpisode:
            json["numeroEpisode"] == null ? null : json["numeroEpisode"],
        nomSerie: json["nomSerie"] == null ? null : json["nomSerie"],
        numeroSaison:
            json["numeroSaison"] == null ? null : json["numeroSaison"],
        casting: json["casting"] == null ? null : json["casting"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "descrition": descrition == null ? null : descrition,
        "image": image == null ? null : image,
        "realisateur": realisateur == null ? null : realisateur,
        "genreMovie": genreMovie == null ? null : genreMovie.toMap(),
        "isFilm": isFilm == null ? null : isFilm,
        "dateSortie": dateSortie == null ? null : dateSortie,
        "urlMovie": urlMovie == null ? null : urlMovie,
        "numeroEpisode": numeroEpisode == null ? null : numeroEpisode,
        "nomSerie": nomSerie == null ? null : nomSerie,
        "numeroSaison": numeroSaison == null ? null : numeroSaison,
        "casting": casting == null ? null : casting,
      };
}

class GenreMovie {
  GenreMovie({
    this.id,
    this.titre,
  });

  String id;
  String titre;

  factory GenreMovie.fromMap(Map<String, dynamic> json) => GenreMovie(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
      };
}
