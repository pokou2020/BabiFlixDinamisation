
import 'package:baby_flix/babiflix/provider/data.dart';
import 'package:baby_flix/babiflix/provider/filmProvider.dart';
import 'package:baby_flix/babiflix/provider/genreProvider.dart';
import 'package:baby_flix/babiflix/provider/serieProvider.dart';
import 'package:baby_flix/babiflix/screen/Liste_Films.dart';
import 'package:baby_flix/babiflix/screen/suggession.dart';
import 'package:baby_flix/babiflix/screen/vuFilm.dart';
import 'package:flutter/material.dart';
//import 'package:english_words/english_words.dart' as english_words;
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        final filmsData = Provider.of<FilmProvider>(context);
    //       final genreData = Provider.of<GenreProvider>(context);
    // final serieData = Provider.of<SerieProvider>(context);
   
    // final providerCat = Provider.of<Categories>(context);
    // final dataCategories = providerCat.items;
    // final providerSousCat = Provider.of<SousCategories>(context);
    // final dataSousCat = providerSousCat.items;
    return DefaultTabController(
      length: filmsData.films.length,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFFee7b77)),
          backgroundColor: Colors.white,
          title: Text(
            'Search App',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: DataSearch(filmData));
                })
          ],
          bottom: PreferredSize(
              child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  indicatorColor: Color(0xFFee7b77),
                  tabs: [
                    ...filmsData.films.map(
                      (e) => Tab(
                        child: Text(
                          e.titre,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ]),
              preferredSize: Size.fromHeight(50.0)),
        ),
        body: TabBarView(
          children: [
            ...filmsData.films.map((e) => Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: e.titre.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ListeFilm(
                                      
                                      )));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: MediaQuery.of(context).size.height / 6,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    // color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        e.titre,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  )),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30.0,
                                        right: 30.0,
                                        top: 8.0,
                                        bottom: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  e.titre),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                  ))
                                ],
                              )),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final List<FilmProvider> listWProds;

  DataSearch(this.listWProds);

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty
        ? listWProds
        : listWProds.where((p) => p.films.contains(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Suggession(
                    
                      )));
        },
        trailing: IconButton(
            icon: Icon(Icons.remove_red_eye),
            onPressed: () => MaterialPageRoute(
                builder: (_) => VuFilm(
               
                ))),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].films[index].titre.substring(0, query.length),
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].films[index].titre.substring(0, query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
