import 'package:baby_flix/babiflix/provider/episodeProvider.dart';
import 'package:baby_flix/babiflix/provider/filmProvider.dart';
import 'package:baby_flix/babiflix/provider/model/filmModel.dart';
import 'package:baby_flix/babiflix/screen/detailserie.dart';
import 'package:baby_flix/babiflix/screen/film.dart';
import 'package:baby_flix/babiflix/screen/movieDetail.dart';
import 'package:baby_flix/babiflix/screen/vuSeriePaysage.dart';
import 'package:baby_flix/babiflix/screen/vufilmPaysage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VuSerie extends StatefulWidget {
   static const routeName = '/Episode_Detail';
  @override
  _VuSerieState createState() => _VuSerieState();
}

class _VuSerieState extends State<VuSerie> {
  bool _portraitPosition=true;
 bool init = true;
  double opacite = 1.0;
  VideoPlayerController _controller;


  @override
 Future<void> didChangeDependencies() async {
    if (init) {
      print("//////////////Bonsoir les gars//////////////////////");
      await Provider.of<EpisodeProvider>(context, listen: false)
          .getAllEpisode();
      _controller = VideoPlayerController.network(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });

      setState(() {
        init = false;
      });
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  
  @override
  Widget build(BuildContext context) {
    setState(() {
      _portraitPosition=MediaQuery.of(context).orientation==Orientation.portrait;
    });
    return Scaffold(
      body: (_portraitPosition)? DetailSerie():VuSeriePaysage(),
      
    );
  }
    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}