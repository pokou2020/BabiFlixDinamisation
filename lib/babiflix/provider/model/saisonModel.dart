// To parse this JSON data, do
//
//     final saison = saisonFromMap(jsonString);

import 'dart:convert';

Saison saisonFromMap(String str) => Saison.fromMap(json.decode(str));

String saisonToMap(Saison data) => json.encode(data.toMap());

class Saison {
    Saison({
        this.id,
        this.serieId,
        this.titreSaison,
        this.imageSaison,
    });

    String id;
    String serieId;
    String titreSaison;
    String imageSaison;

    factory Saison.fromMap(Map<String, dynamic> json) => Saison(
        id: json["id"] == null ? null : json["id"],
        serieId: json["serieId"] == null ? null : json["serieId"],
        titreSaison: json["titreSaison"] == null ? null : json["titreSaison"],
        imageSaison: json["imageSaison"] == null ? null : json["imageSaison"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "serieId": serieId == null ? null : serieId,
        "titreSaison": titreSaison == null ? null : titreSaison,
        "imageSaison": imageSaison == null ? null : imageSaison,
    };
}
