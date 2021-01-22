class Serie {
  Serie({
    this.id,
    this.titreSerie,
    this.imageSerie,
    this.nombreSaisonSerie,
    this.status,
    this.dateSortieSerie,
    this.saison,
  });

  String id;
  String titreSerie;
  String imageSerie;
  String nombreSaisonSerie;
  bool status;
  String dateSortieSerie;
  List<Saison> saison;
}

class Saison {
  Saison({
    this.id,
    // this.idSerie,
    this.titreSaison,
    this.imageSaison,
    this.episode,
  });

  String id;
  String titreSaison;
  String imageSaison;
  // String idSerie;
  List<Episode> episode;
}

class Episode {
  Episode({
    this.id,
    // this.idSaison,
    this.titreEpisode,
    this.numeroEpisode,
    this.imageSaison,
    this.description,
    this.urlEpisode,
  });

  String id;
//  String idSaison;
  String titreEpisode;
  String numeroEpisode;
  String imageSaison;
  String description;
  String urlEpisode;
}



// To parse this JSON data, do
//
//     final serie = serieFromMap(jsonString);

// import 'dart:convert';

// Serie serieFromMap(String str) => Serie.fromMap(json.decode(str));

// String serieToMap(Serie data) => json.encode(data.toMap());

// class Serie {
//     Serie({
//         this.id,
//         this.titreSerie,
//         this.imageSerie,
//         this.nombreSaisonSerie,
//         this.status,
//         this.dateSortieSerie,
//     });

//     String id;
//     String titreSerie;
//     String imageSerie;
//     String nombreSaisonSerie;
//     bool status;
//     String dateSortieSerie;

//     factory Serie.fromMap(Map<String, dynamic> json) => Serie(
//         id: json["id"] == null ? null : json["id"],
//         titreSerie: json["titreSerie"] == null ? null : json["titreSerie"],
//         imageSerie: json["imageSerie"] == null ? null : json["imageSerie"],
//         nombreSaisonSerie: json["nombreSaisonSerie"] == null ? null : json["nombreSaisonSerie"],
//         status: json["status"] == null ? null : json["status"],
//         dateSortieSerie: json["dateSortieSerie"] == null ? null : json["dateSortieSerie"],
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "titreSerie": titreSerie == null ? null : titreSerie,
//         "imageSerie": imageSerie == null ? null : imageSerie,
//         "nombreSaisonSerie": nombreSaisonSerie == null ? null : nombreSaisonSerie,
//         "status": status == null ? null : status,
//         "dateSortieSerie": dateSortieSerie == null ? null : dateSortieSerie,
//     };
// }








// To parse this JSON data, do
//
//     final serie = serieFromMap(jsonString);

// import 'dart:convert';

// Serie serieFromMap(String str) => Serie.fromMap(json.decode(str));

// String serieToMap(Serie data) => json.encode(data.toMap());

// class Serie {
//     Serie({
//         this.id,
//         this.titreSerie,
//         this.imageSerie,
//         this.nombreSaisonSerie,
//         this.status,
//         this.dateSortieSerie,
//         this.saison,
//     });

//     String id;
//     String titreSerie;
//     String imageSerie;
//     String nombreSaisonSerie;
//     bool status;
//     String dateSortieSerie;
//     List<Saison> saison;

//     factory Serie.fromMap(Map<String, dynamic> json) => Serie(
//         id: json["id"] == null ? null : json["id"],
//         titreSerie: json["titreSerie"] == null ? null : json["titreSerie"],
//         imageSerie: json["imageSerie"] == null ? null : json["imageSerie"],
//         nombreSaisonSerie: json["nombreSaisonSerie"] == null ? null : json["nombreSaisonSerie"],
//         status: json["status"] == null ? null : json["status"],
//         dateSortieSerie: json["dateSortieSerie"] == null ? null : json["dateSortieSerie"],
//         saison: json["saison"] == null ? null : List<Saison>.from(json["saison"].map((x) => Saison.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "titreSerie": titreSerie == null ? null : titreSerie,
//         "imageSerie": imageSerie == null ? null : imageSerie,
//         "nombreSaisonSerie": nombreSaisonSerie == null ? null : nombreSaisonSerie,
//         "status": status == null ? null : status,
//         "dateSortieSerie": dateSortieSerie == null ? null : dateSortieSerie,
//         "saison": saison == null ? null : List<dynamic>.from(saison.map((x) => x.toMap())),
//     };
// }

// class Saison {
//     Saison({
//         this.id,
//         this.titreSaison,
//         this.imageSaison,
//         this.episode,
//     });

//     String id;
//     String titreSaison;
//     String imageSaison;
//     List<Episode> episode;

//     factory Saison.fromMap(Map<String, dynamic> json) => Saison(
//         id: json["id"] == null ? null : json["id"],
//         titreSaison: json["titreSaison"] == null ? null : json["titreSaison"],
//         imageSaison: json["imageSaison"] == null ? null : json["imageSaison"],
//         episode: json["Episode"] == null ? null : List<Episode>.from(json["Episode"].map((x) => Episode.fromMap(x))),
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "titreSaison": titreSaison == null ? null : titreSaison,
//         "imageSaison": imageSaison == null ? null : imageSaison,
//         "Episode": episode == null ? null : List<dynamic>.from(episode.map((x) => x.toMap())),
//     };
// }

// class Episode {
//     Episode({
//         this.id,
//         this.titreEpisode,
//         this.numeroEpisode,
//         this.imageSaison,
//         this.description,
//         this.urlEpisode,
//     });

//     String id;
//     String titreEpisode;
//     String numeroEpisode;
//     String imageSaison;
//     String description;
//     String urlEpisode;

//     factory Episode.fromMap(Map<String, dynamic> json) => Episode(
//         id: json["id"] == null ? null : json["id"],
//         titreEpisode: json["titreEpisode"] == null ? null : json["titreEpisode"],
//         numeroEpisode: json["numeroEpisode"] == null ? null : json["numeroEpisode"],
//         imageSaison: json["imageSaison"] == null ? null : json["imageSaison"],
//         description: json["description"] == null ? null : json["description"],
//         urlEpisode: json["UrlEpisode"] == null ? null : json["UrlEpisode"],
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "titreEpisode": titreEpisode == null ? null : titreEpisode,
//         "numeroEpisode": numeroEpisode == null ? null : numeroEpisode,
//         "imageSaison": imageSaison == null ? null : imageSaison,
//         "description": description == null ? null : description,
//         "UrlEpisode": urlEpisode == null ? null : urlEpisode,
//     };
// }
