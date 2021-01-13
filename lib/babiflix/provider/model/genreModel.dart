// To parse this JSON data, do
//
//     final genre = genreFromMap(jsonString);

import 'dart:convert';

Genre genreFromMap(String str) => Genre.fromMap(json.decode(str));

String genreToMap(Genre data) => json.encode(data.toMap());

class Genre {
    Genre({
        this.id,
        this.titre,
        this.status,
    });

    String id;
    String titre;
    bool status;

    factory Genre.fromMap(Map<String, dynamic> json) => Genre(
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