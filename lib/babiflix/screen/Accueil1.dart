import 'package:baby_flix/babiflix/provider/filmProvider.dart';
import 'package:baby_flix/babiflix/provider/genreProvider.dart';
import 'package:baby_flix/babiflix/provider/model/serieModel.dart';
import 'package:baby_flix/babiflix/provider/serieProvider.dart';
import 'package:baby_flix/babiflix/screen/Liste_saison.dart';
import 'package:baby_flix/babiflix/screen/film.dart';
import 'package:baby_flix/babiflix/widget/drawer.dart';
import 'package:baby_flix/babiflix/widget/series.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Acceuil1 extends StatefulWidget {
  @override
  _Acceuil1State createState() => _Acceuil1State();
}

class _Acceuil1State extends State<Acceuil1>
    with SingleTickerProviderStateMixin {
  bool init = true;
  @override
  Future<void> didChangeDependencies() async {
    if (init) {
      var now = new DateTime.now();
      print(now);
      print("//////////////Bonjour le monde//////////////////////");
      await Provider.of<FilmProvider>(context, listen: false).getAllFilm();
      await Provider.of<SerieProvider>(context, listen: false).getAllSerie();

      await Provider.of<GenreProvider>(context, listen: false).getAllGenre();

      setState(() {
        init = false;
      });
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      endDrawer: Drawers(),
      body: init ? Center(child: CircularProgressIndicator()) : MainBody(),
    );
  }
}

class MainBody extends StatefulWidget {
  @override
  _MainBodyState createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  @override
  Widget build(BuildContext context) {
    final filmsData = Provider.of<FilmProvider>(context);
    final genreData = Provider.of<GenreProvider>(context);
    final serieData = Provider.of<SerieProvider>(context);
    print(filmsData);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/bbf.png"))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            }),
                      ),
                    ],
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 1.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(59, 59, 60, 1)),
                          child: TextField(
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: IconButton(
                                  icon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed("suggession");
                                  }),
                              hintText: "Recherche de Film, Tv, Videos",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              //labelText: "Recherche de Film, Tv, Videos",
                              // labelStyle: TextStyle(
                              //   color: Colors.grey,

                              // )
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  child: ListView(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child:
                  //       Container(
                  //         height: 50,
                  //         width: 100,
                  //      decoration: BoxDecoration(
                  //        image: DecorationImage(image: AssetImage("images/bbf.png"))
                  //      ),
                  //   ),

                  // ),

                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      child: Text("Babiflix Original",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    child: CarouselSlider.builder(
                        itemCount: serieData?.series?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  ListeSaison.routeName,
                                  arguments: serieData.series[index].id);
                            },
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        serieData.series[index].imageSerie),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "TV Series   Action",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(230, 30, 36, 1)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: FittedBox(
                                            child: Text(
                                              serieData
                                                  .series[index].titreSerie,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(230, 30, 36, 1),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              child: FittedBox(
                                            child: Text(
                                              serieData.series[index]
                                                  .dateSortieSerie,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          )),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Container(
                                            child: Text(
                                              "-",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          autoPlay: true,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Text(
                        "Dernier sortie",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filmsData.films.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          filmsData.films[i].image),
                                      fit: BoxFit.cover)),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Text(
                        "Explorer par categeorie",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: genreData.genre.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("Liste_Films");
                            },
                            child: Container(
                              width: 100,
                              child: Center(
                                child: Text(
                                  genreData.genre[index].titre,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Text(
                        "Films",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: filmsData.films.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                FilmDetail.routeName,
                                arguments: filmsData.films[i].id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(filmsData.films[i].image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Text(
                        "Serie",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("movieDetail");
                    },
                    child: Container(
                      height: 150,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/film3.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/film2.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/serie3.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/serie1.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("VoirPlus");
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    child: Center(
                                      child: Text(
                                        "Voir plus",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Text(
                        "Afrique",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: filmsData.getgenreFlimAfrique().length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                FilmDetail.routeName,
                                arguments:
                                    filmsData.getgenreFlimAfrique()[i].id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(filmsData
                                        .getgenreFlimAfrique()[i]
                                        .image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Text(
                        "Comique",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: filmsData.getgenreFlimAComique().length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                FilmDetail.routeName,
                                arguments:
                                    filmsData.getgenreFlimAComique()[i].id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(filmsData
                                        .getgenreFlimAComique()[i]
                                        .image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    // color: Color.fromRGBO(59, 59, 60, 1),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 70,
                                          width: 100,
                                          child: Icon(
                                            Icons.tv,
                                            color: Colors.red,
                                            size: 70,
                                          )),

                                      SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        height: 20,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "images/bbf.png"))),
                                      ),
                                      // SizedBox(height: 10,),
                                      //         Container(
                                      //     height: 25,
                                      //     width: 70,
                                      //     child:Center(
                                      //         child: Text(
                                      //           "Voir",
                                      //           style: TextStyle(
                                      //             color: Colors.white
                                      //     ),
                                      //         ),
                                      //     ),
                                      //     decoration: BoxDecoration(
                                      //         borderRadius: BorderRadius.circular(10),
                                      //         color: Colors.red
                                      //     ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //  SizedBox(
                        //           height: 5,
                        //         ),
                        //       Center(
                        //    child: Container(

                        //      width: MediaQuery.of(context).size.width/1.4,
                        //      height: MediaQuery.of(context).size.height/5,
                        //      decoration: BoxDecoration(
                        //        border: Border.all(
                        //          width: 10,
                        //          color: Colors.red
                        //        )
                        //      ),
                        //    ),
                        //  ),
                        SizedBox(
                          height: 20,
                        ),

                        //    Container(
                        //      color: Colors.red,
                        //      height: 50,
                        //     width: MediaQuery.of(context).size.width/1.7,
                        //      child: Center(
                        //        child: Text('Telecharger sur Youtube',
                        //        style: TextStyle(
                        //          fontSize: 15,
                        //          color: Colors.white
                        //        ),
                        //        ),
                        //      ),
                        //    ),
                        //      SizedBox(
                        //    height: 10,
                        //  ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
      //          floatingActionButton: Row(
      //            mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //            children: [
      //                   Padding(
      //                     padding: const EdgeInsets.all(25),
      //                     child:
      //                         Container(
      //                           height: 50,
      //                           width: 100,
      //                        decoration: BoxDecoration(
      //                          image: DecorationImage(image: AssetImage("images/bbf.png"))
      //                        ),
      //                     ),

      //                   ),
      //              IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: (){
      //               Scaffold.of(context).openEndDrawer();

      //              }
      //              ),
      //            ],
      //          ),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
