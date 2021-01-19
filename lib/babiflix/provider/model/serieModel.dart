// To parse this JSON data, do
//
//     final serie = serieFromMap(jsonString);

import 'dart:convert';

import 'saisonModel.dart';

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
    this.saisonList,
  });

  String id;
  String titreSerie;
  String imageSerie;
  int nombreSaisonSerie;
  bool status;
  String dateSortieSerie;
  List<Saison> saisonList;

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
        saisonList: json["saison"] == null
            ? null
            : List<Saison>.from(json["saison"].map((x) => Saison.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titreSerie": titreSerie == null ? null : titreSerie,
        "imageSerie": imageSerie == null ? null : imageSerie,
        "nombreSaisonSerie":
            nombreSaisonSerie == null ? null : nombreSaisonSerie,
        "status": status == null ? null : status,
        "dateSortieSerie": dateSortieSerie == null ? null : dateSortieSerie,
        "saison": saisonList == null
            ? null
            : List<dynamic>.from(saisonList.map((x) => x.toMap())),
      };
}
