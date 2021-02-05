import 'package:baby_flix/babiflix/provider/episodeProvider.dart';
import 'package:baby_flix/babiflix/provider/filmProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:baby_flix/babiflix/provider/filmProvider.dart';
import 'package:baby_flix/babiflix/provider/model/filmModel.dart';
import 'package:video_player/video_player.dart';

class VuPaysageEpisode extends StatefulWidget {
  static const routeName = '/VuEpisodePaysage';
 
  @override
  _VuPaysageEpisodeState createState() => _VuPaysageEpisodeState();
}

class _VuPaysageEpisodeState extends State<VuPaysageEpisode> {
 bool init = true;
 bool _portraitPosition = true;
  double opacite = 1.0;
  VideoPlayerController _controller;


  @override
 Future<void> didChangeDependencies() async {
 if(init){
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
  Widget build(BuildContext context,) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
   //filmsData = Provider.of<FilmProvider>(context);
   final episodeSaison = Provider.of<EpisodeProvider>(context);
    final saisonID = ModalRoute.of(context).settings.arguments as String;
    final selectedEpisode = episodeSaison.episodes
        .where((episode) => episode.id.contains(saisonID))
        .toList();
    
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      body: (_portraitPosition)? init ? Center(
        child: CircularProgressIndicator(),
      ):
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: _controller.value.initialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("${selectedEpisode[0].imageSaisons}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      this.opacite = 1.0 - this.opacite;
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: Opacity(
                    opacity: opacite,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 1.2,
                        top: MediaQuery.of(context).size.height / 2.2,
                      ),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ):
      SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: _controller.value.initialized
                            ? AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              )
                            : Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(selectedEpisode
                                            .isNotEmpty
                                        ? "${episodeSaison.episodes[0].imageSaisons}"
                                        : "https://www.eduprizeschools.net/wp-content/uploads/2016/06/No_Image_Available.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            this.opacite = 1.0 - this.opacite;
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                          });
                        },
                        child: Opacity(
                          opacity: opacite,
                          child: Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height / 1.2,
                              top: MediaQuery.of(context).size.height / 2.2,
                            ),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.4),
                            ),
                            child: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    
    

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _controller.value.isPlaying
      //           ? _controller.pause()
      //           : _controller.play();
      //     });
      //   },
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}