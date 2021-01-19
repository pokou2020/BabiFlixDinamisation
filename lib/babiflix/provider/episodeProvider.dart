import 'package:baby_flix/babiflix/provider/model/episodeModel.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EpisodeProvider with ChangeNotifier{
   List<Episode> _episodes=[];
   List<Episode> get episode => this._episodes;

   Future<void> getAllEpisode() async{
 final url="https://babiflixdinamisation-default-rtdb.firebaseio.com/episode.json";
   try{
     final result= await http.get(url);
      print("Get info from provider");
      print(result.body);
      print(result.statusCode);
          if (result.statusCode == 200) {
        final fetchData = json.decode(result.body) as Map<String, dynamic>;
        List<Episode> all = [];
        fetchData.forEach((key, value) {
          Episode newEpisode = Episode.fromMap(value);
          newEpisode.id = key;
          all.add(newEpisode);
          print("////////////////Nouveau add ${newEpisode.toMap()}//////////////////////////");
        });
        _episodes = all;
        notifyListeners();
      }
    } catch (e) {
      print("Error to get info from provider ${e.toString()}");
    }
   }
  
}