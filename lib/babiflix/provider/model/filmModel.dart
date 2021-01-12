import 'package:flutter/material.dart';

class Film with ChangeNotifier {
  final String id;
  final String titre;
  final String descrip;
  final String image;
  final String genre;
  Film({
    @required this.id,
     @required this.titre,
    @required this.descrip,
    @required this.image,
    @required this.genre,
  });



}
