
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model/saisonModel.dart';

class SaisonProvider with ChangeNotifier{
   List<Saison> _saisons=[];
   List<Saison> get saisons => this._saisons;

   Future<void> getAllESaison() async{
 final url="https://babiflixdinamisation-default-rtdb.firebaseio.com/saison.json";
   try{
     final result= await http.get(url);
      print("Get info from provider");
      print(result.body);
      print(result.statusCode);
          if (result.statusCode == 200) {
        final fetchData = json.decode(result.body) as Map<String, dynamic>;
        List<Saison> all = [];
        fetchData.forEach((key, value) {
          Saison newSaison = Saison.fromMap(value);
          newSaison.id = key;
          all.add(newSaison);
          print("////////////////Nouveau add ${newSaison.toMap()}//////////////////////////");
        });
        _saisons = all;
        notifyListeners();
      }
    } catch (e) {
      print("Error to get info from provider ${e.toString()}");
    }
   }
  
}