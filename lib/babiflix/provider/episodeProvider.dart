import 'package:baby_flix/babiflix/provider/model/episodeModel.dart';
import 'package:baby_flix/babiflix/provider/model/saisonModel.dart';
import 'package:baby_flix/babiflix/provider/model/serieModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EpisodeProvider with ChangeNotifier {
  List<Epsiode> _episodes = [];
  List<Epsiode> get episodes => this._episodes;
  Future<void> getAllEpisode() async{
    final url="https://babiflixdinamisation-default-rtdb.firebaseio.com/episode.json";
  try{
    final result = await http.get(url);
     print("////////Get info from provider////////");
      print(result.body);
      print(result.statusCode);
    if(result.statusCode == 200){
       final fetchData = json.decode(result.body) as  Map<String, dynamic> ;
      List<Epsiode> all = [];
      fetchData.forEach((key, value) {
        print(value);
        Epsiode mesepisode = Epsiode.fromMap(value);
        mesepisode.id = key;
        print("/////////////////////key key${key.toString()}/////////////////////key key");
        all.add(mesepisode);
         print("////////////////Nouveau add ${mesepisode.toMap()}//////////////////////////");
      });
      _episodes = all;
      notifyListeners();
    }
  } catch(e){
     print("///////////////Error to get info from provider ${e.toString()}///////////////////:");
  }
  }
}
