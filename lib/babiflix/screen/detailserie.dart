import 'package:baby_flix/babiflix/provider/data.dart';
import 'package:baby_flix/babiflix/provider/episodeProvider.dart';
import 'package:baby_flix/babiflix/provider/model/episodeModel.dart';
import 'package:baby_flix/babiflix/screen/vuPaysageEpisode.dart';
import 'package:baby_flix/babiflix/widget/filmItem.dart';
import 'package:baby_flix/babiflix/widget/teveItem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class DetailSerie extends StatefulWidget {
  static const routeName = '/Episode_Detail';
  @override
  _DetailSerieState createState() => _DetailSerieState();
}

class _DetailSerieState extends State<DetailSerie> {
  // static const menuItems = <String>[
  //   'Saison 1',
  //   'Saison 2',
  //   'Saison 3',
  // ];

  // final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
  //     .map((String value) => DropdownMenuItem<String>(
  //           value: value,
  //           child: Text(
  //             value,
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ))
  //     .toList();
  // String _btnSelectedVAl = 'Saison 1';

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
    final episodeSaison = Provider.of<EpisodeProvider>(context);
    final saisonID = ModalRoute.of(context).settings.arguments as String;
    print("Saisson Id $saisonID");
    final selectedEpisode = episodeSaison.episodes
        .where((episode) => episode.saisonId.contains(saisonID))
        .toList();
    print("SelectedEpisode $selectedEpisode");
    print(
        "/////////////////////Episode*******${episodeSaison.episodes[0].saisonId}*******Episode/////////////////////key key");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(25, 25, 25, 1),
        body: init
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  color: Color.fromRGBO(25, 25, 25, 1),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(
                                'Vous regardez "',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                '${selectedEpisode[0].titreEpisode}',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 18),
                              ),
                              Text(
                                '" En streaming',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        overflow: Overflow.visible,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 2.8,
                            width: MediaQuery.of(context).size.width,
                            child: _controller.value.initialized
                                ? AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  )
                                : Container(
                                    height: MediaQuery.of(context).size.height /
                                        2.8,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            '${selectedEpisode[0].imageSaisons}'),
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
                            child: AnimatedOpacity(
                              opacity: opacite,
                              duration: Duration(milliseconds: 600),
                              child: Container(
                                margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.height / 4.5,
                                  top: MediaQuery.of(context).size.height / 7,
                                ),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(Icons.skip_previous, color: Colors.red),
                            onPressed: () {},
                          ),
                          Text(
                            'Episode ${selectedEpisode[0].numeroEpisode}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.skip_previous, color: Colors.red),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          children: <Widget>[
                            // Text(
                            //   'Informations',
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 18,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 100,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${selectedEpisode[0].imageSaisons}'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  child: Text(
                                    '${selectedEpisode[0].titreEpisode}',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Padding(
                            //   padding: const EdgeInsets.only(right: 20),
                            //   child: Row(
                            //     children: <Widget>[
                            //       Text(
                            //         "Durée : ",
                            //         style: TextStyle(
                            //             color: Colors.red,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //       Expanded(
                            //         child: Text(
                            //           "152 minutes",
                            //           style: TextStyle(color: Colors.white),
                            //         ),
                            //       ),
                            //       Container(
                            //         height: 50,
                            //         width: 100,
                            //         alignment: Alignment.center,
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //           color: Colors.red,
                            //           // border: Border.all(color: Colors.white),
                            //         ),
                            //         child: Text(
                            //           "Telecharger",
                            //           style: TextStyle(
                            //             color: Colors.white,
                            //           ),
                            //         ),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(height: 20),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Synopsis :",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              child: Text(
                                '${selectedEpisode[0].description}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Date d'ajout :",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                '06/01/2021',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Nombre de saison :",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "3",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   // color: Color.fromRGBO(59, 59, 60, 1),
                      //   padding: EdgeInsets.only(left: 30),
                      //   child: Column(
                      //     children: [
                      //       Container(
                      //           alignment: Alignment.centerRight,
                      //           child: DropdownButton(
                      //               items: this._dropDownMenuItems,
                      //               dropdownColor: Colors.black,
                      //               hint: Text(
                      //                 _btnSelectedVAl,
                      //                 style: TextStyle(color: Colors.white),
                      //               ),
                      //               onChanged: (String newValue) {
                      //                 setState(() {
                      //                   _btnSelectedVAl = newValue;
                      //                 });
                      //               })),
                      //       Padding(
                      //         padding: const EdgeInsets.symmetric(vertical: 10),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Column(
                      //                 crossAxisAlignment: CrossAxisAlignment.start,
                      //                 children: [
                      //                   Text(
                      //                     "Episodes :",
                      //                     style: TextStyle(
                      //                         color: Colors.white,
                      //                         fontSize: 20,
                      //                         fontWeight: FontWeight.bold),
                      //                   ),
                      //                   Text(
                      //                     'Ici les épisodes de la saison 1',
                      //                     style: TextStyle(
                      //                       color: Colors.white,
                      //                     ),
                      //                   )
                      //                 ]),
                      //           ],
                      //         ),
                      //       ),
                      //       SizedBox(height: 10),
                      //       Container(
                      //           height: 0.2,
                      //           width: MediaQuery.of(context).size.width,
                      //           color: Colors.white),
                      //       SizedBox(height: 10),
                      //       Container(
                      //         height: 130,
                      //         child: ListView.builder(
                      //           scrollDirection: Axis.horizontal,
                      //           itemCount: 3,
                      //           itemBuilder: (context, i) {
                      //             return Container(
                      //               margin: EdgeInsets.only(right: 20),
                      //               decoration: BoxDecoration(
                      //                   color: Color.fromRGBO(59, 59, 60, 0.5),
                      //                   borderRadius: BorderRadius.circular(10)),
                      //               width: MediaQuery.of(context).size.width / 1.4,
                      //               child: Row(
                      //                 children: [
                      //                   Container(
                      //                     width: 120,
                      //                     height: 100,
                      //                     decoration: BoxDecoration(
                      //                         image: DecorationImage(
                      //                           image: AssetImage('images/film3.jpg'),
                      //                           fit: BoxFit.cover,
                      //                         ),
                      //                         borderRadius: BorderRadius.circular(5)),
                      //                   ),
                      //                   SizedBox(width: 10),
                      //                   Text(
                      //                     'Episode 1',
                      //                     style: TextStyle(
                      //                       color: Colors.white,
                      //                     ),
                      //                   ),
                      //                   Spacer(),
                      //                   IconButton(
                      //                       icon: FaIcon(
                      //                         FontAwesomeIcons.playCircle,
                      //                         color: Color.fromRGBO(230, 30, 36, 1),
                      //                       ),
                      //                       onPressed: () {})
                      //                 ],
                      //               ),
                      //             );
                      //           },
                      //         ),
                      //       ),
                      //       SizedBox(height: 50),
                      //     ],
                      //   ),
                      // )

                      Container(
                        width: MediaQuery.of(context).size.width,
                        // color: Color.fromRGBO(59, 59, 60, 1),
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          children: [
                            // Container(
                            //     alignment: Alignment.centerRight,
                            //     child: DropdownButton(
                            //         items: this._dropDownMenuItems,
                            //         dropdownColor: Colors.black,
                            //         hint: Text(
                            //           _btnSelectedVAl,
                            //           style: TextStyle(color: Colors.white),
                            //         ),
                            //         onChanged: (String newValue) {
                            //           setState(() {
                            //             _btnSelectedVAl = newValue;
                            //           });
                            //         })),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Episodes :",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Ici les épisodes de la saison 1',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      ]),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                                height: 0.2,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white),
                            SizedBox(height: 10),
                            Container(
                              height: 350,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: selectedEpisode.length,
                                itemBuilder: (context, i) {
                                  return Expanded(
                                    child: Container(
                                      height: 110,
                                      margin: EdgeInsets.only(
                                          left: 20, right: 20, bottom: 10),
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(59, 59, 60, 0.5),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                       
                                        children: [
                                         
                                          Expanded(
                                            child: InkWell(
                                               onTap: (){
                                              Navigator.of(context).pushNamed(
                                                VuPaysageEpisode.routeName,
                                                arguments:selectedEpisode[i].id
                                              );
                                            },
                                              child: Container(
                                                width: 120,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${selectedEpisode[i].imageSaisons}"),
                                                      fit: BoxFit.cover,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(5)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15,),
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "${selectedEpisode[i].titreEpisode}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        
                                          IconButton(
                                              icon: FaIcon(
                                                FontAwesomeIcons.playCircle,
                                                color: Color.fromRGBO(
                                                    230, 30, 36, 1),
                                              ),
                                              onPressed: () {})
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 50),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
