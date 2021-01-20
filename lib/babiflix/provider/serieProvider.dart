import 'package:baby_flix/babiflix/provider/model/serieModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SerieProvider with ChangeNotifier {
  List<Serie> _series = [
    Serie(
        id: "1",
        titreSerie: "Breaking Bad",
        imageSerie: "images/serie4.jpg",
        dateSortieSerie: "20/01/2021",
        nombreSaisonSerie: "3",
        saison: [
          Saison(
              id: "s1",
              titreSaison: "Saison 1",
              imageSaison: "images/serie4.jpg",
              episode: [
                Episode(
                  id: "ep1",
                  titreEpisode: "ghost",
                  imageSaison: "images/serie4.jpg",
                  numeroEpisode: "01",
                  description:
                      "James St. Patrick, surnommé « Ghost », est le propriétaire d'une boîte de nuit populaire à New York. En parallèle, il est un acteur majeur dans l'un des plus grands réseaux de drogues illicites de la ville. Ayant du mal à concilier ces deux vies, il souhaite quitter le milieu de la drogue afin de se consacrer à son entreprise licite et protéger sa famille, mais tout ne se passe pas comme prévu.",
                  urlEpisode: "https://www.youtube.com/watch?v=ILK2sa5iLsI",
                ),
                Episode(
                  id: "ep2",
                  titreEpisode: "Tacha",
                  imageSaison: "images/serie4.jpg",
                  numeroEpisode: "02",
                  description:
                      "James St. Patrick, surnommé « Ghost », est le propriétaire d'une boîte de nuit populaire à New York. En parallèle, il est un acteur majeur dans l'un des plus grands réseaux de drogues illicites de la ville. Ayant du mal à concilier ces deux vies, il souhaite quitter le milieu de la drogue afin de se consacrer à son entreprise licite et protéger sa famille, mais tout ne se passe pas comme prévu.",
                  urlEpisode: "https://www.youtube.com/watch?v=ILK2sa5iLsI",
                ),
              ]),
          Saison(
              id: "s2",
              titreSaison: "Saison 2",
              imageSaison: "images/serie4.jpg",
              episode: [
                Episode(
                  id: "ep1",
                  titreEpisode: "ghost & kanan",
                  imageSaison: "images/serie4.jpg",
                  numeroEpisode: "01",
                  description:
                      "James St. Patrick, surnommé « Ghost », est le propriétaire d'une boîte de nuit populaire à New York. En parallèle, il est un acteur majeur dans l'un des plus grands réseaux de drogues illicites de la ville. Ayant du mal à concilier ces deux vies, il souhaite quitter le milieu de la drogue afin de se consacrer à son entreprise licite et protéger sa famille, mais tout ne se passe pas comme prévu.",
                  urlEpisode: "https://www.youtube.com/watch?v=ILK2sa5iLsI",
                ),
              ]),
        ]),
    Serie(
        id: "2",
        titreSerie: "DareDevil",
        imageSerie: "images/serie1.jpg",
        dateSortieSerie: "20/01/2021",
        nombreSaisonSerie: "1",
        saison: [
          Saison(
              id: "s1",
              titreSaison: "Saison 1",
              imageSaison: "images/serie1.jpg",
              episode: [
                Episode(
                  id: "ep1",
                  titreEpisode: "murdock",
                  imageSaison: "images/serie4.jpg",
                  numeroEpisode: "01",
                  description:
                      "James St. Patrick, surnommé « Ghost », est le propriétaire d'une boîte de nuit populaire à New York. En parallèle, il est un acteur majeur dans l'un des plus grands réseaux de drogues illicites de la ville. Ayant du mal à concilier ces deux vies, il souhaite quitter le milieu de la drogue afin de se consacrer à son entreprise licite et protéger sa famille, mais tout ne se passe pas comme prévu.",
                  urlEpisode: "https://www.youtube.com/watch?v=ILK2sa5iLsI",
                ),
                Episode(
                  id: "ep2",
                  titreEpisode: "Mattew",
                  imageSaison: "images/serie4.jpg",
                  numeroEpisode: "02",
                  description:
                      "James St. Patrick, surnommé « Ghost », est le propriétaire d'une boîte de nuit populaire à New York. En parallèle, il est un acteur majeur dans l'un des plus grands réseaux de drogues illicites de la ville. Ayant du mal à concilier ces deux vies, il souhaite quitter le milieu de la drogue afin de se consacrer à son entreprise licite et protéger sa famille, mais tout ne se passe pas comme prévu.",
                  urlEpisode: "https://www.youtube.com/watch?v=ILK2sa5iLsI",
                ),
              ]),
        ])
  ];
  List<Serie> get series => this._series;

  // Future<void> getAllSerie() async{
  //   final url="https://babiflixdinamisation-default-rtdb.firebaseio.com/serie.json";
  // try{
  //   final result = await http.get(url);
  //    print("////////Get info from provider////////");
  //     print(result.body);
  //     print(result.statusCode);
  //   if(result.statusCode == 200){
  //      final fetchData = json.decode(result.body) as  Map<String, dynamic> ;
  //     List<Serie> all = [];
  //     fetchData.forEach((key, value) {
  //       print(value);
  //       Serie mesSerie = Serie.fromMap(value);
  //       mesSerie.id = key;
  //       all.add(mesSerie);
  //        print("////////////////Nouveau add ${mesSerie.toMap()}//////////////////////////");
  //     });
  //     _series = all;
  //     notifyListeners();
  //   }
  // } catch(e){
  //    print("///////////////Error to get info from provider ${e.toString()}///////////////////:");
  // }
  // }
}
