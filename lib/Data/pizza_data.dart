

import 'package:json_annotation/json_annotation.dart';
import 'package:pizza_app/Data/ingredient_data.dart';
import 'package:pizza_app/Data/size_option.dart';

@JsonSerializable()
class PizzaData{
  //final String id;
  //final String imageName;
  //final String imageDetail;
  final String title;
  final String description;
  final int price;
  final List<SizeOptions> size;
  final List<IngredientOptionalData> ingredients;



  PizzaData({/*required this.id,*/ /* required this.imageName,required this.imageDetail,*/ required this.title,required this.description,required this.price, required this.size, required this.ingredients});
  factory PizzaData.fromJson(Map<String, dynamic> parsedJson){
    var listSize = parsedJson['size'] as List;
    var listIngredients = parsedJson['ingredients'] as List;
    List<SizeOptions> sizesList = listSize.map((e) => SizeOptions.fromJson(e)).toList();
    List<IngredientOptionalData> ingredientsList = listIngredients.map((e) => IngredientOptionalData.fromJson(e)).toList();

    return PizzaData(
        title: parsedJson['title'],
        description: parsedJson['description'],
        price: parsedJson['price'],
        size: sizesList,
        ingredients: ingredientsList
    );
   }

}

/*
part 'pizza_data.g.dart';

@JsonSerializable()
class PizzaData{
  //final String id;
  final String imageName;
  final String imageDetail;
  final String title;
  final String description;
  final int price;
  //final List<SizeOptions> size;
  //final List<IngredientOptionalData> ingredients;



  PizzaData({/*required this.id,*/ required this.imageName,required this.imageDetail,required this.title,required this.description,required this.price, /*required this.size, required this.ingredients*/});
  factory PizzaData.fromJson(Map<String, dynamic> json) => _$PizzaDataFromJson(json);
  Map<String, dynamic> toJson() => _$PizzaDataToJson(this);
}
 */
