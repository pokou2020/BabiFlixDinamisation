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
    this.episodeSaison,
  });

  String id;
  String titre;
  int nombreEpisode;
  int numeroSaison;
  String image;
  EpisodeSaison episodeSaison;

  factory Saison.fromMap(Map<String, dynamic> json) => Saison(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        nombreEpisode:
            json["nombreEpisode"] == null ? null : json["nombreEpisode"],
        numeroSaison:
            json["numeroSaison"] == null ? null : json["numeroSaison"],
        image: json["image"] == null ? null : json["image"],
        episodeSaison: json["episodeSaison"] == null
            ? null
            : EpisodeSaison.fromMap(json["episodeSaison"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "nombreEpisode": nombreEpisode == null ? null : nombreEpisode,
        "numeroSaison": numeroSaison == null ? null : numeroSaison,
        "image": image == null ? null : image,
        "episodeSaison": episodeSaison == null ? null : episodeSaison.toMap(),
      };
}

class EpisodeSaison {
  EpisodeSaison({
    this.id,
    this.titre,
    this.realisateur,
    this.image,
    this.nmbreSaison,
    this.dateSaison,
    this.status,
    this.description,
  });

  String id;
  String titre;
  String realisateur;
  String image;
  int nmbreSaison;
  String dateSaison;
  bool status;
  String description;

  factory EpisodeSaison.fromMap(Map<String, dynamic> json) => EpisodeSaison(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        realisateur: json["realisateur"] == null ? null : json["realisateur"],
        image: json["image"] == null ? null : json["image"],
        nmbreSaison: json["nmbreSaison"] == null ? null : json["nmbreSaison"],
        
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
        
        "dateSaison": dateSaison == null ? null : dateSaison,
        "status": status == null ? null : status,
        "description": description == null ? null : description,
      };
}


