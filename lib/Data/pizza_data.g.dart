// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pizza_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PizzaData _$PizzaDataFromJson(Map<String, dynamic> json) {
  return PizzaData(
    id: json['id'] as String,
    imageName: json['imageName'] as String,
    imageDetail: json['imageDetail'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    price: json['price'] as int,
    size: (json['size'] as List<dynamic>)
        .map((e) => SizeOptions.fromJson(e as Map<String, dynamic>))
        .toList(),
    ingredients: (json['ingredients'] as List<dynamic>)
        .map((e) => IngredientOptionalData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PizzaDataToJson(PizzaData instance) => <String, dynamic>{
      'id': instance.id,
      'imageName': instance.imageName,
      'imageDetail': instance.imageDetail,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'size': instance.size,
      'ingredients': instance.ingredients,
    };
