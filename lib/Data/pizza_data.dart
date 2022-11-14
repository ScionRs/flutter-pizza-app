

import 'package:json_annotation/json_annotation.dart';
import 'package:pizza_app/Data/ingredient_data.dart';
import 'package:pizza_app/Data/size_option.dart';

@JsonSerializable()
class PizzaData{
  String? id;
  final String imageName;
  final String imageDetail;
  final String title;
  final String description;
  final int price;
  final int category;
  final List<SizeOptions> size;
  final List<IngredientOptionalData> ingredients;



  PizzaData({this.id,  required this.imageName,required this.imageDetail, required this.title,required this.description,required this.price, required this.category, required this.size, required this.ingredients});
  factory PizzaData.fromJson(Map<String, dynamic> parsedJson){
    var listSize = parsedJson['size'] as List;
    var listIngredients = parsedJson['ingredients'] as List;
    List<SizeOptions> sizesList = listSize.map((e) => SizeOptions.fromJson(e)).toList();
    List<IngredientOptionalData> ingredientsList = listIngredients.map((e) => IngredientOptionalData.fromJson(e)).toList();

    return PizzaData(
        id: parsedJson['_id'],
        imageName: parsedJson['imgName'],
        imageDetail: parsedJson['imgDetail'],
        title: parsedJson['title'],
        description: parsedJson['description'],
        price: parsedJson['price'],
        category: parsedJson['category'],
        size: sizesList,
        ingredients: ingredientsList
    );
   }

   int dataSumSizeElements() => this.size.length;


  @override
  String toString() {
    return 'toString method: PizzaData{imageName: $imageName, imageDetail: $imageDetail, title: $title, description: $description, price: $price, category: $category, size: $size, ingredients: $ingredients}';
  }
}

