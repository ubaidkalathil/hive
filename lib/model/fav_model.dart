import 'package:hive/hive.dart';
part 'fav_model.g.dart';
@HiveType(typeId: 1)
class FavModel {
  @HiveField(0)
  String image;

  FavModel({
    required this.image,
  });

  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}
