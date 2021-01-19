// To parse this JSON data, do
//
//     final serie = serieFromMap(jsonString);

import 'dart:convert';

Serie serieFromMap(String str) => Serie.fromMap(json.decode(str));

String serieToMap(Serie data) => json.encode(data.toMap());

class Serie {
  Serie({
    this.id,
    this.titreSerie,
    this.imageSerie,
    this.nombreSaisonSerie,
    this.status,
    this.dateSortieSerie,
    this.serieSaison,
  });

  String id;
  String titreSerie;
  String imageSerie;
  int nombreSaisonSerie;
  bool status;
  String dateSortieSerie;
  SerieSaison serieSaison;

  factory Serie.fromMap(Map<String, dynamic> json) => Serie(
        id: json["id"] == null ? null : json["id"],
        titreSerie: json["titreSerie"] == null ? null : json["titreSerie"],
        imageSerie: json["imageSerie"] == null ? null : json["imageSerie"],
        nombreSaisonSerie: json["nombreSaisonSerie"] == null
            ? null
            : json["nombreSaisonSerie"],
        status: json["status"] == null ? null : json["status"],
        dateSortieSerie:
            json["dateSortieSerie"] == null ? null : json["dateSortieSerie"],
        serieSaison: json["serieSaison"] == null
            ? null
            : SerieSaison.fromMap(json["serieSaison"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titreSerie": titreSerie == null ? null : titreSerie,
        "imageSerie": imageSerie == null ? null : imageSerie,
        "nombreSaisonSerie":
            nombreSaisonSerie == null ? null : nombreSaisonSerie,
        "status": status == null ? null : status,
        "dateSortieSerie": dateSortieSerie == null ? null : dateSortieSerie,
        "serieSaison": serieSaison == null ? null : serieSaison.toMap(),
      };
}

class SerieSaison {
  SerieSaison({
    this.id,
    this.titreSaison,
    this.imageSaison,
    this.episodeSaison,
  });

  String id;
  String titreSaison;
  String imageSaison;
  EpisodeSaison episodeSaison;

  factory SerieSaison.fromMap(Map<String, dynamic> json) => SerieSaison(
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



