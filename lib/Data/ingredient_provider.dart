
import 'package:flutter/cupertino.dart';

class IngredientProvider with ChangeNotifier{
  final List<int> _selectedPriceIngredients = [];
  int _resultSelectPrice = 0;

  int get resultSelectPrice => _resultSelectPrice;
  List<int> get selectedPriceIngredients => _selectedPriceIngredients;

  void addToList(int value){
    _selectedPriceIngredients.add(value);
    notifyListeners();
  }

  void sumValuesOfSelectedIngredients(){
    _resultSelectPrice = _selectedPriceIngredients.reduce((value, element) => value + element);
    print(_resultSelectPrice);
    notifyListeners();
  }
}