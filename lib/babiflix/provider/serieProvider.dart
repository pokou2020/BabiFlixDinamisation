

import 'package:baby_flix/babiflix/provider/model/serieModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SerieProvider with ChangeNotifier {
  List<Serie> _series = [];
  List<Serie> get series => this._series;


  Future<void> getAllSerie() async{
    final url="https://babiflixdinamisation-default-rtdb.firebaseio.com/serie.json";
  try{
    final result = await http.get(url);
     print("////////Get info from provider////////");
      print(result.body);
      print(result.statusCode);
    if(result.statusCode == 200){


       final fetchData = json.decode(result.body) as Map ;
      List<Serie> all = [];
      fetchData.forEach((key, value) {
        print(value);
        Serie mesSerie = Serie.fromMap(value);
        mesSerie.dateDajout = key;
        all.add(mesSerie);
         print("////////////////Nouveau add ${mesSerie.toMap()}//////////////////////////");
      });
     // _series = all;
      notifyListeners();
    }
  } catch(e){
     print("///////////////Error to get info from provider ${e.toString()}///////////////////:");
  }
  }
}