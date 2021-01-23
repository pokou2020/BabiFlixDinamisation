// To parse this JSON data, do
//
//     final filmtest = filmtestFromMap(jsonString);

import 'dart:convert';

Filmtest filmtestFromMap(String str) => Filmtest.fromMap(json.decode(str));

String filmtestToMap(Filmtest data) => json.encode(data.toMap());

class Filmtest {
  Filmtest({
    this.id,
    this.genreId,
    this.titre,
    this.image,
    this.realisateur,
    this.personnage,
    this.description,
    this.dateSortie,
    this.urlFilm,
    this.status,
  });

  String id;
  String genreId;
  String titre;
  String image;
  String realisateur;
  String personnage;
  String description;
  String dateSortie;
  String urlFilm;
  bool status;

  factory Filmtest.fromMap(Map<String, dynamic> json) => Filmtest(
        id: json["id"] == null ? null : json["id"],
        genreId: json["genreId"] == null ? null : json["genreId"],
        titre: json["titre"] == null ? null : json["titre"],
        image: json["image"] == null ? null : json["image"],
        realisateur: json["realisateur"] == null ? null : json["realisateur"],
        personnage: json["personnage"] == null ? null : json["personnage"],
        description: json["description"] == null ? null : json["description"],
        dateSortie: json["DateSortie"] == null ? null : json["DateSortie"],
        urlFilm: json["urlFilm"] == null ? null : json["urlFilm"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "genreId": genreId == null ? null : genreId,
        "titre": titre == null ? null : titre,
        "image": image == null ? null : image,
        "realisateur": realisateur == null ? null : realisateur,
        "personnage": personnage == null ? null : personnage,
        "description": description == null ? null : description,
        "DateSortie": dateSortie == null ? null : dateSortie,
        "urlFilm": urlFilm == null ? null : urlFilm,
        "status": status == null ? null : status,
      };
}
