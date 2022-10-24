
import 'package:json_annotation/json_annotation.dart';

part 'ingredient_data.g.dart';

@JsonSerializable()
class IngredientOptionalData{
  final String id;
  final String imgName;
  final String title;
  final int price;

  IngredientOptionalData({required this.id, required this.imgName, required this.title, required this.price});

}