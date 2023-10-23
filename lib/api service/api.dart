import 'dart:convert';
import 'dart:io';

import '../model/image_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static Future<ImageModel> getImages() async {
    final uri = Uri.parse("https://randomuser.me/api/?results=5");
    final response = await http.get(uri);
    

    if (response.statusCode == 200) {
      // If the request was successful, parse the JSON response into a Dart object.
// ImageModel.fromJson(jsonDecode(response.body));

      final data = json.decode(response.body);
      ImageModel imageList = ImageModel.fromJson(data);
      print(data);

      return imageList;
    } else {
      // If the request was not successful, throw an exception.
      throw Exception('Failed to fetch images');
    }
  }
}
