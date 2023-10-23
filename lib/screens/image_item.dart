import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hivewithhttp/db/local_db.dart';

import '../model/fav_model.dart';

ValueNotifier fav = ValueNotifier(false);

class ImageItem extends StatelessWidget {
  bool isFav;
  String image;
  ImageItem(this.isFav, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    LocalDB db = LocalDB();
    List<FavModel> favs = db.getAllFavoriteItems();

    for (var element in favs) {
      if (element.image == image) {
        fav.value = true;
      }
    }

    fav.value = isFav; 
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      image,
                    )),
                color: Colors.white,
                border: Border.all(width: .5, color: Colors.grey),
                borderRadius: BorderRadius.circular(12)),
          ),
          ValueListenableBuilder(
            valueListenable: fav,
            builder: (context, value, child) => Positioned(
                top: 10,
                left: 10,
                child: value
                    ? InkWell(
                        onTap: () {
                          // fav.value = false;
                          LocalDB db = LocalDB();
                          db.removeItem(
                              int.parse(db.getIndexOfcartItem(image)),context);
                        },
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          // fav.value = true;
                          LocalDB db = LocalDB();

                          db.addItemToFav(image,context);
                        },
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      )),
          )
        ],
      ),
    );
  }
}
