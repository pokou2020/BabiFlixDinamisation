// import 'package:baby_flix/babiflix/provider/filmProvider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:baby_flix/babiflix/provider/filmProvider.dart';
// import 'package:baby_flix/babiflix/provider/model/filmModel.dart';
// import 'package:video_player/video_player.dart';

// class VuFilmPaysage extends StatefulWidget {
//   @override
//   _VuFilmPaysageState createState() => _VuFilmPaysageState();
// }

// class _VuFilmPaysageState extends State<VuFilmPaysage> {
//   double opacite = 1.0;
//   VideoPlayerController _controller;
//   FilmProvider filmsData;
//   List<Film> getAllGenre;

//   // @override
//   // void didChangeDependencies() {
//   //   filmsData = Provider.of<FilmProvider>(context);
//   //   final routeAgrGenre = ModalRoute.of(context).settings.arguments as Map;
//   //   final filmID = routeAgrGenre["id"];
//   //   final genreID = routeAgrGenre["genreID"];

//   //   final selectedFilm =
//   //       filmsData.films.firstWhere((film) => film.id == filmID);

//   //   getAllGenre = _getAllGenre(genreID);
//   //   _controller = VideoPlayerController.network(
//   //       'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
//   //     ..initialize().then((_) {
//   //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//   //       setState(() {});
//   //     });
//   //   // TODO: implement didChangeDependencies
//   //   super.didChangeDependencies();
//   // }

//   void controlPlayer() {
//     var _controllerValuePsg = _controller.value;
//   }

//   // List<Film> _getAllGenre(String genreID) {
//   //   try {
//   //     return filmsData.films
//   //         .where((film) => film.genreId.contains(genreID))
//   //         .toList();
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     filmsData = Provider.of<FilmProvider>(context);
//     final routeAgrGenre = ModalRoute.of(context).settings.arguments as Map;
//     final filmID = routeAgrGenre["id"];
//     final selectedFilm =
//         filmsData.films.firstWhere((film) => film.id == filmID);
// if (MediaQuery.of(context).orientation == Orientation.portrait) {
//   setState(() {
//     _controller.pause();
//   });
// }
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Stack(
//               overflow: Overflow.visible,
//               children: <Widget>[
//                 Container(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   child: _controller.value.initialized
//                       ? AspectRatio(
//                           aspectRatio: _controller.value.aspectRatio,
//                           child: VideoPlayer(_controller),
//                         )
//                       : Container(
//                           height: MediaQuery.of(context).size.height,
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage("${selectedFilm.image}"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                         ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       this.opacite = 1.0 - this.opacite;
//                       _controller.value.isPlaying
//                           ? _controller.pause()
//                           : _controller.play();
//                     });
//                   },
//                   child: Opacity(
//                     opacity: opacite,
//                     child: Container(
//                       margin: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.height / 1.2,
//                         top: MediaQuery.of(context).size.height / 2.2,
//                       ),
//                       height: 70,
//                       width: 70,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.black.withOpacity(0.4),
//                       ),
//                       child: Icon(
//                         _controller.value.isPlaying
//                             ? Icons.pause
//                             : Icons.play_arrow,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     setState(() {
//       //       _controller.value.isPlaying
//       //           ? _controller.pause()
//       //           : _controller.play();
//       //     });
//       //   },
//       //   child: Icon(
//       //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//       //   ),
//       // ),
//     );
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _controller.dispose();
//   }
// }
