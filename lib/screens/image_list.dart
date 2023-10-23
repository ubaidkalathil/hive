import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hivewithhttp/api%20service/api.dart';
import 'package:hivewithhttp/model/image_model.dart';
import 'package:hivewithhttp/screens/image_item.dart';

class ImageList extends StatefulWidget {
  const ImageList({super.key});

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  List<ImageModel> images = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Image List"),
            ),
            body: FutureBuilder<ImageModel>(
              future: ApiClient.getImages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child:
                          CircularProgressIndicator()); // Display a loading indicator.
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  ImageModel? favorites = snapshot.data;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisSpacing: 0.0
                            // Number of columns in the grid
                            ),
                    itemBuilder: (context, index) {
                      return ImageItem(
                          false, favorites.results[index].picture.medium);
                    },
                    itemCount: favorites!.results.length,
                  );
                }
              },
            )));
  }
}
