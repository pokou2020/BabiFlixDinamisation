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
  void dynamicSearch() {
    setState(() {
      search = !search;
    });
  }

  static const menuItems = <String>[
    "Action",
    'Afrique',
    'Novelas',
    'Fixion',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.white),
            ),
          ))
      .toList();
  String _btnSelectedVAl = "Humour";

  Widget defaultAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Container(
          width: MediaQuery.of(context).size.width / 5,
          child: Image(
            image: AssetImage('images/bbf.png'),
          )),
      //     Text(
      //   genreTitle,
      //   style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      // ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () => dynamicSearch())
      ],
    );
  }

  Widget searchAppBar() {
    return AppBar(
      backgroundColor: Color(0xff191919),
      title: TextField(
        style: TextStyle(color: Colors.black),
        autofocus: true,
        decoration: InputDecoration(
            hintText: "rechercher un film",
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey)),
      ),
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: () => dynamicSearch()),
    );
  }

  bool init = true;

  @override
  Future<void> didChangeDependencies() async {
    if (init) {
      var now = new DateTime.now();
      print(now);
      print("//////////////Bonsoir famille//////////////////////");
      // await Provider.of<FilmProviderTest>(context, listen: false);

      setState(() {
        init = false;
      });
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final filmData = Provider.of<FilmProvider>(context);
    // final routeArgs =
    //         ModalRoute.of(context).settings.arguments as Map<String, String>;
    //     genreTitle = routeArgs['title'];

    final genreID = ModalRoute.of(context).settings.arguments as String;

    final selectedfilm =
        filmData.films.where((film) => film.genreId.contains(genreID)).toList();

    return Scaffold(
      appBar: search ? searchAppBar() : defaultAppBar(),
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
