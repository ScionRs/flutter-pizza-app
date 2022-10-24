

import 'dart:convert';
import 'dart:io';

import 'package:pizza_app/Data/pizza_data.dart';

class ApiClient {
  final client = HttpClient();
  
  Future<List<PizzaData>> getPizzas() async{
    final url = Uri.parse('http://localhost:3000/pizza');
    final request = await client.getUrl(url);
    final response = await request.close();
    final json = await response
    .transform(utf8.decoder)
    .toList()
    .then((value) => value.join())
    .then((value) => jsonDecode(value) as List<dynamic>);
    final result = json
    .map((dynamic e) => PizzaData.fromJson(e as Map<String, dynamic>))
    .toList();
    return result;
  }
}