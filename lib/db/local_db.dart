import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hivewithhttp/screens/fav_images.dart';


import '../model/fav_model.dart';

class LocalDB {
  final favBox = Hive.box<FavModel>("fav_db");
  getAllFavoriteItems() {
    List<FavModel> data = [];
    data.addAll(favBox.values);
    // print(cartDB.length);
    return data;
  }

  addItemToFav(String url,BuildContext context) {
    final newOne = FavModel(image: url);
    favBox.add(newOne);

    favNotifier.value.add(newOne);
    favNotifier.notifyListeners(); 
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Added to favorite"),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      elevation: 6.0,
    ));
  }
  // addAllItemToFav(List<FavModel> items) {
  //   favBox.addAll(items);
  //   favNotifier.value.addAll(items);
  //   favNotifier.notifyListeners();

  // }

  removeItem(int index,BuildContext context) async {
    await favBox.deleteAt(index);
    print(favBox.values.length);
    favNotifier.value = [];
    favNotifier.value.addAll(favBox.values);
    favNotifier.notifyListeners();

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Removed from favorites"),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      elevation: 6.0,
    ));
  }

  getIndexOfcartItem(String url) {
    List<FavModel> fav = [];
    fav.addAll(favBox.values);
    String index = "";
    for (var i = 0; i < fav.length; i++) {
      if (url == fav[i].image) {
        index = i.toString();
      }
    }
    return index;
  }

  getTotalLength() {
    List<FavModel> data = [];
    data.addAll(favBox.values);
    return data.length;
  }
}
