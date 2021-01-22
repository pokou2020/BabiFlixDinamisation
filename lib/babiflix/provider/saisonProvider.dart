import 'package:baby_flix/babiflix/provider/model/saisonModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SaisonProvider with ChangeNotifier {
  List<Saison> _saisons = [];
  List<Saison> get saisons => this._saisons;

  Future<void> getAllsaison() async{
    final url="https://babiflixdinamisation-default-rtdb.firebaseio.com/saison.json";
  try{
    final result = await http.get(url);
     print("////////Get info from provider////////");
      print(result.body);
      print(result.statusCode);
    if(result.statusCode == 200){
       final fetchData = json.decode(result.body) as  Map<String, dynamic> ;
      List<Saison> all = [];
      fetchData.forEach((key, value) {
        print(value);
        Saison mesSaison = Saison.fromMap(value);
        mesSaison.id = key;
        print("/////////////////////key key${key.toString()}/////////////////////key key");
        all.add(mesSaison);
         print("////////3333333333333333333333333///////mesSaison ${mesSaison.toMap()}mesSaison///////////3333333333333333//////");
      });
      _saisons = all;
      notifyListeners();
    }
  } catch(e){
     print("///////////////Error to get info from provider ${e.toString()}///////////////////:");
  }
  }
}
