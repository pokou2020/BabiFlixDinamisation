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
        this.image,
        this.nombreSaison,
        this.status,
        this.dateDajout,
        this.genreSerie,
        this.serieSaison,
    });

    String id;
    String titre;
    String image;
    int nombreSaison;
    bool status;
    String dateDajout;
    GenreSerie genreSerie;
    SerieSaison serieSaison;

    factory Serie.fromMap(Map<String, dynamic> json) => Serie(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        image: json["image"] == null ? null : json["image"],
        nombreSaison: json["nombreSaison"] == null ? null : json["nombreSaison"],
        status: json["status"] == null ? null : json["status"],
        dateDajout: json["dateDajout"] == null ? null : json["dateDajout"],
        genreSerie: json["genreSerie"] == null ? null : GenreSerie.fromMap(json["genreSerie"]),
        serieSaison: json["serieSaison"] == null ? null : SerieSaison.fromMap(json["serieSaison"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "image": image == null ? null : image,
        "nombreSaison": nombreSaison == null ? null : nombreSaison,
        "status": status == null ? null : status,
        "dateDajout": dateDajout == null ? null : dateDajout,
        "genreSerie": genreSerie == null ? null : genreSerie.toMap(),
        "serieSaison": serieSaison == null ? null : serieSaison.toMap(),
    };
}

class GenreSerie {
    GenreSerie({
        this.id,
        this.titre,
        this.status,
    });

    String id;
    String titre;
    bool status;

    factory GenreSerie.fromMap(Map<String, dynamic> json) => GenreSerie(
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

class SerieSaison {
    SerieSaison({
        this.id,
        this.titre,
        this.image,
        this.episodes,
    });

    String id;
    String titre;
    String image;
    Episodes episodes;

    factory SerieSaison.fromMap(Map<String, dynamic> json) => SerieSaison(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        image: json["image"] == null ? null : json["image"],
        episodes: json["episodes"] == null ? null : Episodes.fromMap(json["episodes"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "image": image == null ? null : image,
        "episodes": episodes == null ? null : episodes.toMap(),
    };
}

class Episodes {
    Episodes({
        this.id,
        this.titre,
        this.image,
        this.description,
        this.urlEpisodes,
    });

    String id;
    String titre;
    String image;
    String description;
    String urlEpisodes;

    factory Episodes.fromMap(Map<String, dynamic> json) => Episodes(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        image: json["image"] == null ? null : json["image"],
        description: json["description"] == null ? null : json["description"],
        urlEpisodes: json["urlEpisodes"] == null ? null : json["urlEpisodes"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "image": image == null ? null : image,
        "description": description == null ? null : description,
        "urlEpisodes": urlEpisodes == null ? null : urlEpisodes,
    };
}
