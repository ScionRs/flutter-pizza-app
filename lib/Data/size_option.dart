
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SizeOptions{
  final String size;
  final String description;
  final int price;

  SizeOptions({required this.size, required this.description, required this.price});
  factory SizeOptions.fromJson(Map<String, dynamic> parsedJson){
    return SizeOptions(
        size: parsedJson['size'],
        description: parsedJson['description'],
        price: parsedJson['price'],
    );
  }

  @override
  String toString() {
    return 'SizeOptions{size: $size, description: $description, price: $price}';
  }
}

/*
part 'size_option.g.dart';

@JsonSerializable()
class SizeOptions{
  final String size;
  final String description;
  final int price;

  SizeOptions({required this.size, required this.description, required this.price});
  factory SizeOptions.fromJson(Map<String, dynamic> json) =>
      _$SizeOptionsFromJson(json);
}
 */