// To parse this JSON data, do
//
//     final saison = saisonFromMap(jsonString);

import 'dart:convert';

import 'episodeModel.dart';

Saison saisonFromMap(String str) => Saison.fromMap(json.decode(str));

String saisonToMap(Saison data) => json.encode(data.toMap());

class Saison {
  Saison({
    this.id,
    this.titreSaison,
    this.imageSaison,
    this.episode,
  });

  String id;
  String titreSaison;
  String imageSaison;
  List<Episode> episode;

  factory Saison.fromMap(Map<String, dynamic> json) => Saison(
        id: json["id"] == null ? null : json["id"],
        titreSaison: json["titreSaison"] == null ? null : json["titreSaison"],
        imageSaison: json["imageSaison"] == null ? null : json["imageSaison"],
        episode: json["Episode"] == null
            ? null
            : List<Episode>.from(
                json["Episode"].map((x) => Episode.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titreSaison": titreSaison == null ? null : titreSaison,
        "imageSaison": imageSaison == null ? null : imageSaison,
        "Episode": episode == null
            ? null
            : List<dynamic>.from(episode.map((x) => x.toMap())),
      };
}
