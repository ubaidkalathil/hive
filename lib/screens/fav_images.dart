import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hivewithhttp/model/fav_model.dart';
import 'package:hivewithhttp/db/local_db.dart';

import '../api service/api.dart';
import '../model/image_model.dart';
import 'image_item.dart';

ValueNotifier<List<FavModel>> favNotifier = ValueNotifier([]);

class FavoriteImages extends StatefulWidget {
  const FavoriteImages({super.key});

  @override
  State<FavoriteImages> createState() => _FavoriteImagesState();
}

class _FavoriteImagesState extends State<FavoriteImages> {
  @override
  Widget build(BuildContext context) {
    LocalDB db = LocalDB();
    favNotifier.value = db.getAllFavoriteItems();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Favorite List"),
          ),
          body: ValueListenableBuilder(
            valueListenable: favNotifier,
            builder: (BuildContext context, List<FavModel> favItems,
                    Widget? child) => 
                GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 0.0
                  // Number of columns in the grid
                  ),
              itemBuilder: (context, index) =>
                  ImageItem(true, favItems[index].image),
              itemCount: favItems.length,
            ),
          )),
    );
  }
}
