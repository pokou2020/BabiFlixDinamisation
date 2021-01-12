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
        this.description,
        this.image,
        this.realisateur,
        this.genre,
        this.dateSortie,
        this.isFilm,
        this.saison,
        this.status,
        this.urlFims,
        this.numeroEpisode,
    });

    String id;
    String titre;
    String description;
    String image;
    String realisateur;
    String genre;
    String dateSortie;
    bool isFilm;
    String saison;
    bool status;
    String urlFims;
    int numeroEpisode;

    factory Film.fromMap(Map<String, dynamic> json) => Film(
        id: json["id"] == null ? null : json["id"],
        titre: json["titre"] == null ? null : json["titre"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : json["image"],
        realisateur: json["realisateur"] == null ? null : json["realisateur"],
        genre: json["genre"] == null ? null : json["genre"],
        dateSortie: json["dateSortie"] == null ? null : json["dateSortie"],
        isFilm: json["isFilm"] == null ? null : json["isFilm"],
        saison: json["saison"] == null ? null : json["saison"],
        status: json["status"] == null ? null : json["status"],
        urlFims: json["urlFims"] == null ? null : json["urlFims"],
        numeroEpisode: json["numeroEpisode"] == null ? null : json["numeroEpisode"],
    );
//permette de convertir ma classe en map
    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "titre": titre == null ? null : titre,
        "description": description == null ? null : description,
        "image": image == null ? null : image,
        "realisateur": realisateur == null ? null : realisateur,
        "genre": genre == null ? null : genre,
        "dateSortie": dateSortie == null ? null : dateSortie,
        "isFilm": isFilm == null ? null : isFilm,
        "saison": saison == null ? null : saison,
        "status": status == null ? null : status,
        "urlFims": urlFims == null ? null : urlFims,
        "numeroEpisode": numeroEpisode == null ? null : numeroEpisode,
    };
}


//2 methode pour prendre nos donnes
//asynchrone permet d'excecute le code rapidement
//inistate est excecute  une seul fois
