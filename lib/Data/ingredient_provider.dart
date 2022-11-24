

import 'package:flutter/cupertino.dart';
import 'package:pizza_app/Data/pizza_data.dart';

class IngredientProvider with ChangeNotifier {
  final List<int> _selectedPriceIngredients = [];
  final List<PizzaData> _pizzaDataProviderList = [];
  int _resultSelectPrice = 0;


  List<PizzaData> get pizzaDataProviderList => _pizzaDataProviderList;

  int get resultSelectPrice => _resultSelectPrice;

  List<int> get selectedPriceIngredients => _selectedPriceIngredients;

  void addToList(int value) {
    _selectedPriceIngredients.add(value);
    notifyListeners();
  }

  void sumValuesOfSelectedIngredients() {
    _resultSelectPrice =
        _selectedPriceIngredients.reduce((value, element) => value + element);
    print(_resultSelectPrice);
    notifyListeners();
  }

  void addToPizzaDataList(PizzaData pizzaData){
    _pizzaDataProviderList.add(pizzaData);
    print("From provider: $_pizzaDataProviderList");
    notifyListeners();
  }

  List<PizzaData> giveThePizzaList(){
    return pizzaDataProviderList;
  }

  int lengthProductList(){
    int reduce = pizzaDataProviderList.length;
    return reduce;
  }

  int reduceProductList(){
    int reduce = pizzaDataProviderList.fold(0,(value, element) => value + element.price);
    return reduce;
  }

  int bonusMoneyFromProductList(){
      int reduce = pizzaDataProviderList.fold(0, (value, element) => value + element.price);
      if (reduce != 0) {
        int finalSum = (reduce / 3).toInt();
        return finalSum;
      } else {
        return 0;
      }
  }
}