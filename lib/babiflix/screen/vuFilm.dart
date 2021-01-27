import 'package:baby_flix/babiflix/provider/filmProvider.dart';
import 'package:baby_flix/babiflix/provider/model/filmModel.dart';
import 'package:baby_flix/babiflix/screen/film.dart';
import 'package:baby_flix/babiflix/screen/vufilmPaysage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VuFilm extends StatefulWidget {
   static const routeName = '/film-detail';
  @override
  _VuFilmState createState() => _VuFilmState();
}

class _VuFilmState extends State<VuFilm> {
  bool _portraitPosition=true;
  double opacite=1.0;
  VideoPlayerController _controller;
  FilmProvider filmsData ;
  List<Film>getAllGenre;


  @override
  void didChangeDependencies() {
    filmsData = Provider.of<FilmProvider>(context);
    final  routeAgrGenre = ModalRoute.of(context).settings.arguments as Map;
    final filmID=routeAgrGenre["id"];
    final genreID=routeAgrGenre["genreID"];
    print("///////////////argument $routeAgrGenre");

    final selectedFilm =
        filmsData.films.firstWhere((film) => film.id == filmID);

       getAllGenre = _getAllGenre(genreID);
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
    List<Film> _getAllGenre(String genreID){
          try{
          return  
        filmsData.films.where((film) => film.genreId.contains(genreID)).toList();
          }catch(e){
            print("Exception get all films ");
            print(e);
            // return [];
          }
        }
  @override
  Widget build(BuildContext context) {
    setState(() {
      _portraitPosition=MediaQuery.of(context).orientation==Orientation.portrait;
    });
    return Scaffold(
      body: (_portraitPosition)?FilmDetail():VuFilmPaysage(),
      
    );
  }
    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}