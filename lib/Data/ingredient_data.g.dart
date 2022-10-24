// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientOptionalData _$IngredientOptionalDataFromJson(
    Map<String, dynamic> json) {
  return IngredientOptionalData(
    id: json['id'] as String,
    imgName: json['imgName'] as String,
    title: json['title'] as String,
    price: json['price'] as int,
  );
}

Map<String, dynamic> _$IngredientOptionalDataToJson(
        IngredientOptionalData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imgName': instance.imgName,
      'title': instance.title,
      'price': instance.price,
    };
