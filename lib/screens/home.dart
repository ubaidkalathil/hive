import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fav_images.dart';
import 'image_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 235, 235, 235),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const ImageList()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: .5, color: Colors.grey),
                          borderRadius: BorderRadius.circular(6)),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Image List"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const FavoriteImages()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: .5, color: Colors.grey),
                          borderRadius: BorderRadius.circular(6)),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Favorite Images",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}