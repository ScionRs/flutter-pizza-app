// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizeOptions _$SizeOptionsFromJson(Map<String, dynamic> json) {
  return SizeOptions(
    size: json['size'] as String,
    description: json['description'] as String,
    price: json['price'] as int,
  );
}

Map<String, dynamic> _$SizeOptionsToJson(SizeOptions instance) =>
    <String, dynamic>{
      'size': instance.size,
      'description': instance.description,
      'price': instance.price,
    };
