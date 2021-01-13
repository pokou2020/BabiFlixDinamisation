// To parse this JSON data, do
//
//     final serie = serieFromMap(jsonString);

import 'dart:convert';

Serie serieFromMap(String str) => Serie.fromMap(json.decode(str));

String serieToMap(Serie data) => json.encode(data.toMap());

class Serie {
    Serie({
        this.id,
        this.titre,
        this.realisateur,
        this.image,
        this.nmbreSaison,
        this.genreFilm,
        this.dateDeSaison,
        this.status,
        this.description,
    });

    String id;
    String titre;
    String realisateur;
    String image;
    int nmbreSaison;
    GenreFilm genreFilm;
    String dateDeSaison;
    bool status;
    String description;

    factory Serie.fromMap(Map<String, dynamic> json) => Serie(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        realisateur: json["realisateur"] == null ? null : json["realisateur"],
        image: json["image"] == null ? null : json["image"],
        nmbreSaison: json["nmbreSaison"] == null ? null : json["nmbreSaison"],
        genreFilm: json["genreFilm"] == null ? null : GenreFilm.fromMap(json["genreFilm"]),
        dateDeSaison: json["dateDeSaison"] == null ? null : json["dateDeSaison"],
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
        "dateDeSaison": dateDeSaison == null ? null : dateDeSaison,
        "status": status == null ? null : status,
        "description": description == null ? null : description,
    };
}

class GenreFilm {
    GenreFilm({
        this.id,
        this.titre,
        this.statut,
    });

    String id;
    String titre;
    bool statut;

    factory GenreFilm.fromMap(Map<String, dynamic> json) => GenreFilm(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        statut: json["statut"] == null ? null : json["statut"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "statut": statut == null ? null : statut,
    };
}
