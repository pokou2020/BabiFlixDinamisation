// To parse this JSON data, do
//
//     final epsiode = epsiodeFromMap(jsonString);

import 'dart:convert';

Epsiode epsiodeFromMap(String str) => Epsiode.fromMap(json.decode(str));

String epsiodeToMap(Epsiode data) => json.encode(data.toMap());

class Epsiode {
    Epsiode({
        this.id,
        this.saisonId,
        this.titreEpisode,
        this.numeroEpisode,
        this.imageSaisons,
        this.description,
        this.urlEpisode,
    });

    String id;
    String saisonId;
    String titreEpisode;
    String numeroEpisode;
    String imageSaisons;
    String description;
    String urlEpisode;

    factory Epsiode.fromMap(Map<String, dynamic> json) => Epsiode(
        id: json["id"] == null ? null : json["id"],
        saisonId: json["saisonId"] == null ? null : json["saisonId"],
        titreEpisode: json["titreEpisode"] == null ? null : json["titreEpisode"],
        numeroEpisode: json["numeroEpisode"] == null ? null : json["numeroEpisode"],
        imageSaisons: json["imageSaisons"] == null ? null : json["imageSaisons"],
        description: json["description"] == null ? null : json["description"],
        urlEpisode: json["UrlEpisode"] == null ? null : json["UrlEpisode"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "saisonId": saisonId == null ? null : saisonId,
        "titreEpisode": titreEpisode == null ? null : titreEpisode,
        "numeroEpisode": numeroEpisode == null ? null : numeroEpisode,
        "imageSaisons": imageSaisons == null ? null : imageSaisons,
        "description": description == null ? null : description,
        "UrlEpisode": urlEpisode == null ? null : urlEpisode,
    };
}
