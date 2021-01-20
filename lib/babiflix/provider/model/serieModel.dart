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
    this.titreSaison,
    this.imageSaison,
    this.episode,
  });

  String id;
  String titreSaison;
  String imageSaison;
  List<Episode> episode;
}

class Episode {
  Episode({
    this.id,
    this.titreEpisode,
    this.numeroEpisode,
    this.imageSaison,
    this.description,
    this.urlEpisode,
  });

  String id;
  String titreEpisode;
  String numeroEpisode;
  String imageSaison;
  String description;
  String urlEpisode;
}
