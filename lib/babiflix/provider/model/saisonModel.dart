// To parse this JSON data, do
//
//     final saison = saisonFromMap(jsonString);

import 'dart:convert';

Saison saisonFromMap(String str) => Saison.fromMap(json.decode(str));

String saisonToMap(Saison data) => json.encode(data.toMap());

class Saison {
  Saison({
    this.id,
    this.titre,
    this.nombreEpisode,
    this.numeroSaison,
    this.image,
    this.serieSaison,
  });

  String id;
  String titre;
  int nombreEpisode;
  int numeroSaison;
  String image;
  SerieSaison serieSaison;

  factory Saison.fromMap(Map<String, dynamic> json) => Saison(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        nombreEpisode:
            json["nombreEpisode"] == null ? null : json["nombreEpisode"],
        numeroSaison:
            json["numeroSaison"] == null ? null : json["numeroSaison"],
        image: json["image"] == null ? null : json["image"],
        serieSaison: json["serieSaison"] == null
            ? null
            : SerieSaison.fromMap(json["serieSaison"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "nombreEpisode": nombreEpisode == null ? null : nombreEpisode,
        "numeroSaison": numeroSaison == null ? null : numeroSaison,
        "image": image == null ? null : image,
        "serieSaison": serieSaison == null ? null : serieSaison.toMap(),
      };
}

class SerieSaison {
  SerieSaison({
    this.id,
    this.titre,
    this.realisateur,
    this.image,
    this.nmbreSaison,
    this.genreFilm,
    this.dateSaison,
    this.status,
    this.description,
  });

  String id;
  String titre;
  String realisateur;
  String image;
  int nmbreSaison;
  GenreFilm genreFilm;
  String dateSaison;
  bool status;
  String description;

  factory SerieSaison.fromMap(Map<String, dynamic> json) => SerieSaison(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        realisateur: json["realisateur"] == null ? null : json["realisateur"],
        image: json["image"] == null ? null : json["image"],
        nmbreSaison: json["nmbreSaison"] == null ? null : json["nmbreSaison"],
        genreFilm: json["genreFilm"] == null
            ? null
            : GenreFilm.fromMap(json["genreFilm"]),
        dateSaison: json["dateSaison"] == null ? null : json["dateSaison"],
        status: json["status"] == null ? null : json["status"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "realisateur": realisateur == null ? null : realisateur,
        "image": image == null ? null : image,
        "nmbreSaison": nmbreSaison == null ? null : nmbreSaison,
        "genreFilm": genreFilm == null ? null : genreFilm.toMap(),
        "dateSaison": dateSaison == null ? null : dateSaison,
        "status": status == null ? null : status,
        "description": description == null ? null : description,
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
  String status;

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