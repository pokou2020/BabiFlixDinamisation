// To parse this JSON data, do
//
//     final episode = episodeFromMap(jsonString);

import 'dart:convert';

Episode episodeFromMap(String str) => Episode.fromMap(json.decode(str));

String episodeToMap(Episode data) => json.encode(data.toMap());

class Episode {
  Episode({
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

  factory Episode.fromMap(Map<String, dynamic> json) => Episode(
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
