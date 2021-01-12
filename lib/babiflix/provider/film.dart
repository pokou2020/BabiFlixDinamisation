import 'package:flutter/material.dart';

class Film with ChangeNotifier {
  final String id;
  final String descrip;
  final String image;
  final String genre;
  Film({
    @required this.id,
    @required this.descrip,
    @required this.image,
    @required this.genre,
  });

  // Future<void> addFilm(Film film) async {
  //   const url = 'https://sydney-apps-projet.firebaseio.com/products.json';
  //   try {
  //     final response = await http.post(
  //       url,
  //       body: json.encode({
  //         'title': product.title,
  //         'description': product.description,
  //         'imagURl': product.imageUrl,
  //         'price': product.price,
  //         'isFavorite': product.isFavorite,
  //       }),
  //     );

  //     final newProduct = Product(
  //       title: product.title,
  //       description: product.description,
  //       price: product.price,
  //       imageUrl: product.imageUrl,
  //       id: json.decode(response.body)['name'],
  //     );
  //     _items.add(newProduct);
  //     // _items.insert(0, newProduct); // at the start of the list
  //     notifyListeners();
  //   } catch (error) {
  //     print(error);
  //     throw error;
  //   }
  // }
}
