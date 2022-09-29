import 'package:flutter/material.dart';
import 'package:pizza_app/Data/ingredient_provider.dart';
import 'package:pizza_app/widgets/App.dart';
import 'package:provider/provider.dart';

void main() {
  const app = App();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => IngredientProvider()),
    ],
    child: app,),
  );
}


