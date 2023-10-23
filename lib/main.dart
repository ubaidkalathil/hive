import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hivewithhttp/screens/fav_images.dart';
import 'package:hivewithhttp/model/image_model.dart';
import 'package:hivewithhttp/screens/home.dart';
import 'package:hivewithhttp/screens/image_list.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'model/fav_model.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(FavModelAdapter());
  // final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDirectory.path);
  Hive.openBox<FavModel>("fav_db");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive and API Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
