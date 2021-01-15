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
    this.image,
    this.realisateur,
    this.personnage,
    this.description,
    this.genreFilm,
    this.dateSortie,
    this.urlFilm,
    this.status,
  });

  String id;
  String titre;
  String image;
  String realisateur;
  String personnage;
  String description;
  GenreFilm genreFilm;
  String dateSortie;
  String urlFilm;
  bool status;

  factory Film.fromMap(Map<String, dynamic> json) => Film(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        image: json["image"] == null ? null : json["image"],
        realisateur: json["realisateur"] == null ? null : json["realisateur"],
        personnage: json["personnage"] == null ? null : json["personnage"],
        description: json["description"] == null ? null : json["description"],
        genreFilm: json["genreFilm"] == null
            ? null
            : GenreFilm.fromMap(json["genreFilm"]),
        dateSortie: json["DateSortie"] == null ? null : json["DateSortie"],
        urlFilm: json["urlFilm"] == null ? null : json["urlFilm"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "image": image == null ? null : image,
        "realisateur": realisateur == null ? null : realisateur,
        "personnage": personnage == null ? null : personnage,
        "description": description == null ? null : description,
        "genreFilm": genreFilm == null ? null : genreFilm.toMap(),
        "DateSortie": dateSortie == null ? null : dateSortie,
        "urlFilm": urlFilm == null ? null : urlFilm,
        "status": status == null ? null : status,
      };
}

class GenreFilm {
  GenreFilm({
    this.id,
    this.titre,
    this.status,
  });

  String id;
  String titre;
  bool status;

  factory GenreFilm.fromMap(Map<String, dynamic> json) => GenreFilm(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "status": status == null ? null : status,
      };
}
