
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class IngredientOptionalData{
  final String id;
  final String imgName;
  final String title;
  final int price;

  IngredientOptionalData({required this.id, required this.imgName, required this.title, required this.price});
  factory IngredientOptionalData.fromJson(Map<String, dynamic> parsedJson){
    return IngredientOptionalData(
      id: parsedJson['_id'],
      imgName: parsedJson['imgName'],
      title: parsedJson['title'],
      price: parsedJson['price'],
    );
  }
  }

/*
part 'ingredient_data.g.dart';

@JsonSerializable()
class IngredientOptionalData{
  final String id;
  final String imgName;
  final String title;
  final int price;

  IngredientOptionalData({required this.id, required this.imgName, required this.title, required this.price});
  factory IngredientOptionalData.fromJson(Map<String, dynamic> json) =>
      _$IngredientOptionalDataFromJson(json);
  Map<String, dynamic> toJson() => _$IngredientOptionalDataToJson(this);
}
 */