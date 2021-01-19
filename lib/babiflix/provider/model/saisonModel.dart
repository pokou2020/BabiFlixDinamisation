// To parse this JSON data, do
//
//     final saison = saisonFromMap(jsonString);

import 'dart:convert';

Saison saisonFromMap(String str) => Saison.fromMap(json.decode(str));

String saisonToMap(Saison data) => json.encode(data.toMap());

class Saison {
  Saison({
    this.id,
    this.titreSaison,
    this.imageSaison,
    this.episodeSaison,
  });

  String id;
  String titreSaison;
  String imageSaison;
  EpisodeSaison episodeSaison;

  factory Saison.fromMap(Map<String, dynamic> json) => Saison(
        id: json["id"] == null ? null : json["id"],
        titreSaison: json["titreSaison"] == null ? null : json["titreSaison"],
        imageSaison: json["imageSaison"] == null ? null : json["imageSaison"],
        episodeSaison: json["episodeSaison"] == null
            ? null
            : EpisodeSaison.fromMap(json["episodeSaison"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titreSaison": titreSaison == null ? null : titreSaison,
        "imageSaison": imageSaison == null ? null : imageSaison,
        "episodeSaison": episodeSaison == null ? null : episodeSaison.toMap(),
      };
}

class EpisodeSaison {
  EpisodeSaison({
    this.id,
    this.titreEpisode,
    this.numeroEpisode,
    this.imageSaison,
    this.description,
    this.urlEpisode,
  });

  String id;
  String titreEpisode;
  String numeroEpisode;
  String imageSaison;
  String description;
  String urlEpisode;

  factory EpisodeSaison.fromMap(Map<String, dynamic> json) => EpisodeSaison(
        id: json["id"] == null ? null : json["id"],
        titreEpisode:
            json["titreEpisode"] == null ? null : json["titreEpisode"],
        numeroEpisode:
            json["numeroEpisode"] == null ? null : json["numeroEpisode"],
        imageSaison: json["imageSaison"] == null ? null : json["imageSaison"],
        description: json["description"] == null ? null : json["description"],
        urlEpisode: json["UrlEpisode"] == null ? null : json["UrlEpisode"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titreEpisode": titreEpisode == null ? null : titreEpisode,
        "numeroEpisode": numeroEpisode == null ? null : numeroEpisode,
        "imageSaison": imageSaison == null ? null : imageSaison,
        "description": description == null ? null : description,
        "UrlEpisode": urlEpisode == null ? null : urlEpisode,
      };
}
