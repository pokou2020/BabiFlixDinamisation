import 'package:baby_flix/babiflix/provider/data.dart';
import 'package:baby_flix/babiflix/provider/filmProvider.dart';
import 'package:baby_flix/babiflix/provider/model/saisonModel.dart';
import 'package:baby_flix/babiflix/provider/saisonProvider.dart';
import 'package:baby_flix/babiflix/provider/serieProvider.dart';
import 'package:baby_flix/babiflix/screen/detailserie.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class ListeSaison extends StatefulWidget {
  static const routeName = '/Liste_saison';
  //pour afficher la liste des saisons
  final List<Saison> availableSaison;
  ListeSaison(this.availableSaison);

  @override
  _ListeSaisonState createState() => _ListeSaisonState();
}

class _ListeSaisonState extends State<ListeSaison> {
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
      //  Text(
      //   'BABIFLIX',
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
   

  // bool _loadedInitData = false;
  // String categoryTitle;

  //@override
  // void didChangeDependencies() {
  //    if (!_loadedInitData) {
  //       final routeArgs =
  //           ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
  //       categoryTitle = routeArgs['title'];
  //       final saisonId = routeArgs['id'];
  //       displayedSaison = widget.availableSaison.where((saisons) {
  //         return serieData.contains(saisonId);
  //       }).toList();
  //       _loadedInitData = true;
  //     }

  //   super.didChangeDependencies();
  // }
   bool init = true;
  @override
  Future<void> didChangeDependencies() async {
    if (init) {
      var now = new DateTime.now();
      print(now);
      print("//////////////Bonsoir famille//////////////////////");
       await Provider.of<SaisonProvider>(context, listen: false).getAllsaison();


      setState(() {
        init = false;
      });
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
  final saisonData=Provider.of<SaisonProvider>(context);
  final serieID=ModalRoute.of(context).settings.arguments as String;
  final selectedSaison=saisonData.saisons.where((saison) => saison.serieId.contains(serieID)).toList();
  print(selectedSaison);
    
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
                  itemCount: selectedSaison.length,
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
                        onTap: (){
                          Navigator.of(context).pushNamed(DetailSerie.routeName,
                          arguments: saisonData.saisons[index].id
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${selectedSaison[index].imageSaison}'),
                                  fit: BoxFit.cover),
                              color: Colors.grey,
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
                                      "Saison${selectedSaison[index].numeroSaison}",
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
                                  "${selectedSaison[index].titreSaison}",
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
