// To parse this JSON data, do
//
//     final film = filmFromMap(jsonString);

import 'dart:convert';

Film filmFromMap(String str) => Film.fromMap(json.decode(str));

String filmToMap(Film data) => json.encode(data.toMap());

class Film {
    Film({
        this.id,
        this.titre,
        this.descrition,
        this.image,
        this.realisateur,
        this.genreMovie,
        this.isFilm,
        this.dateSortie,
        this.urlMovie,
        this.numeroEpisode,
        this.nomSerie,
        this.numeroSaison,
        this.nomPersonnage,
        this.status,
        this.saison,
    });

    String id;
    String titre;
    String descrition;
    String image;
    String realisateur;
    GenreMovie genreMovie;
    bool isFilm;
    String dateSortie;
    String urlMovie;
    int numeroEpisode;
    String nomSerie;
    int numeroSaison;
    String nomPersonnage;
    bool status;
    Saison saison;

    factory Film.fromMap(Map<String, dynamic> json) => Film(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        descrition: json["descrition"] == null ? null : json["descrition"],
        image: json["image"] == null ? null : json["image"],
        realisateur: json["realisateur"] == null ? null : json["realisateur"],
        genreMovie: json["genreMovie"] == null ? null : GenreMovie.fromMap(json["genreMovie"]),
        isFilm: json["isFilm"] == null ? null : json["isFilm"],
        dateSortie: json["dateSortie"] == null ? null : json["dateSortie"],
        urlMovie: json["urlMovie"] == null ? null : json["urlMovie"],
        numeroEpisode: json["numeroEpisode"] == null ? null : json["numeroEpisode"],
        nomSerie: json["nomSerie"] == null ? null : json["nomSerie"],
        numeroSaison: json["numeroSaison"] == null ? null : json["numeroSaison"],
        nomPersonnage: json["nomPersonnage"] == null ? null : json["nomPersonnage"],
        status: json["status"] == null ? null : json["status"],
        saison: json["saison"] == null ? null : Saison.fromMap(json["saison"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "descrition": descrition == null ? null : descrition,
        "image": image == null ? null : image,
        "realisateur": realisateur == null ? null : realisateur,
        "genreMovie": genreMovie == null ? null : genreMovie.toMap(),
        "isFilm": isFilm == null ? null : isFilm,
        "dateSortie": dateSortie == null ? null : dateSortie,
        "urlMovie": urlMovie == null ? null : urlMovie,
        "numeroEpisode": numeroEpisode == null ? null : numeroEpisode,
        "nomSerie": nomSerie == null ? null : nomSerie,
        "numeroSaison": numeroSaison == null ? null : numeroSaison,
        "nomPersonnage": nomPersonnage == null ? null : nomPersonnage,
        "status": status == null ? null : status,
        "saison": saison == null ? null : saison.toMap(),
    };
}

class GenreMovie {
    GenreMovie({
        this.id,
        this.titre,
    });

    String id;
    String titre;

    factory GenreMovie.fromMap(Map<String, dynamic> json) => GenreMovie(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
    };
}

class Saison {
    Saison({
        this.id,
        this.titre,
        this.nombreEpisode,
        this.numeroSaison,
        this.image,
        this.serieSaison,
    });

    String id;
    String titre;
    int nombreEpisode;
    int numeroSaison;
    String image;
    String serieSaison;

    factory Saison.fromMap(Map<String, dynamic> json) => Saison(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        nombreEpisode: json["nombreEpisode"] == null ? null : json["nombreEpisode"],
        numeroSaison: json["numeroSaison"] == null ? null : json["numeroSaison"],
        image: json["image"] == null ? null : json["image"],
        serieSaison: json["serieSaison"] == null ? null : json["serieSaison"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "nombreEpisode": nombreEpisode == null ? null : nombreEpisode,
        "numeroSaison": numeroSaison == null ? null : numeroSaison,
        "image": image == null ? null : image,
        "serieSaison": serieSaison == null ? null : serieSaison,
    };
}
