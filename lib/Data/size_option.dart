
import 'package:json_annotation/json_annotation.dart';
part 'size_option.g.dart';

@JsonSerializable()
class SizeOptions{
  final String size;
  final String description;
  final int price;

  SizeOptions({required this.size, required this.description, required this.price});
  factory SizeOptions.fromJson(Map<String, dynamic> json) =>
      _$SizeOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$SizeOptionsToJson(this);
}