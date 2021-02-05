import 'package:baby_flix/babiflix/provider/filmProvider.dart';
import 'package:baby_flix/babiflix/provider/filmProviderTest.dart';
import 'package:baby_flix/babiflix/provider/serieProvider.dart';
import 'package:baby_flix/babiflix/screen/vuFilm.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import 'film.dart';

class ListeFilm extends StatefulWidget {
  static const routeName = '/Liste_film';
   
  @override
  _ListeFilmState createState() => _ListeFilmState();
}

class _ListeFilmState extends State<ListeFilm> {
  bool search = false;
 



  @override
  Widget build(BuildContext context) {
    final filmData = Provider.of<FilmProvider>(context);
    // final loadedProduct =
    //     Provider.of<SousCategories>(context, listen: false).findById(this.id);
    // final products = Provider.of<Products>(context).items;
    // final routeArgs =
    //         ModalRoute.of(context).settings.arguments as Map<String, String>;
    //     genreTitle = routeArgs['title'];

    final genreID = ModalRoute.of(context).settings.arguments as String;

    final selectedfilm =
        filmData.films.where((film) => film.genreId.contains(genreID)).toList();

    return Scaffold(

      body: Container(
        color: Color(0xff262626),
        width: MediaQuery.of(context).size.width,
        height: 850,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                    child: GridView.builder(
                  itemCount: selectedfilm.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(VuFilm.routeName,
                              arguments: {
                                "genreID": genreID,
                                "id": selectedfilm[index].id
                              });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${selectedfilm[index].image}'),
                                  fit: BoxFit.cover),
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 60,
                                    color: Colors.black38,
                                    child: Text(
                                      "${selectedfilm[index].dateSortie}",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(59, 59, 60, 1),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  "${selectedfilm[index].titre}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                    //just for testing, will fill with image later
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
