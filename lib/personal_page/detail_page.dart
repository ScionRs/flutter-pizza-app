import 'package:flutter/material.dart';
import 'package:pizza_app/Data/ingredient_data.dart';
import 'package:pizza_app/Data/ingredient_provider.dart';
import 'package:pizza_app/Data/pizza_data.dart';
import 'package:pizza_app/theme/colors.dart';
import 'package:pizza_app/widgets/IngredientItem.dart';
import '../main_screen/main_screen_widget.dart';
import 'package:provider/provider.dart';

const List<Widget> pizzaSize = <Widget>[
  Text('Маленькая'),
  Text('Средняя'),
  Text('Верхняя'),
];

const List<int> pizzaSizePrice = [399, 420, 600];

const List<Widget> pizzaDough = <Widget>[
  Text('Тонкое'),
  Text('Традиционное'),
];

final _listOfIngredients = [
  IngredientOptionalData(
    id:1,
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/cdea869ef287426386ed634e6099a5ba.png',
    title: 'Сливочная моцарелла',
    price: 79,
  ),
  IngredientOptionalData(
    id:2,
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/370dac9ed21e4bffaf9bc2618d258734.png',
    title: 'Итальянские травы',
    price: 39,
  ),
  IngredientOptionalData(
    id:3,
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA61B9A8D61',
    title: 'Ветчина',
    price: 79,
  ),
  IngredientOptionalData(
    id:4,
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/b2f3a5d5afe44516a93cfc0d2ee60088.png',
    title: 'Митболы',
    price: 79,
  ),
  IngredientOptionalData(
    id:5,
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA62D5D6027',
    title: 'Острая чоризо',
    price: 79,
  ),
  IngredientOptionalData(
    id:6,
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/000D3A21DA51A81211E9AFA6A277BB50',
    title: 'Сыр блю чиз',
    price: 79,
  ),
  IngredientOptionalData(
    id:7,
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA6B0FFC349',
    title: 'Кубики брынзы',
    price: 79,
  ),
  IngredientOptionalData(
    id:8,
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA6258199C3',
    title: 'Пикантная пепперони',
    price: 79,
  ),
  IngredientOptionalData(
    id:9,
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA67259A324',
    title: 'Шампиньоны',
    price: 59,
  ),
  IngredientOptionalData(
    id:10,
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA63F774C1B',
    title: 'Сладкий перец',
    price: 59,
  ),
  IngredientOptionalData(
    id:11,
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA60AE6464C',
    title: 'Красный лук',
    price: 59,
  ),
  IngredientOptionalData(
    id:12,
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/000D3A21DA51A81211E9AFA6795BA2A0',
    title: 'Сочные анансы',
    price: 59,
  ),
];



class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.pizzaData}) : super(key: key);
  final PizzaData pizzaData;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<bool> _selectedPizzaSize = <bool>[false,true,false]; // Размер пиццы
  final List<bool> _selectedPizzaDough = <bool>[true,false]; // Тесто
  List<IngredientOptionalData> selectedList = [];
  List<int> priceSelectedList = [0]; // добавляю 1 или получаю BadState
  int result = 0;
  int pizzaPrice = 0;
  /*
  Все это суммирую
   */
  int reduceSum(){
    setState(() {
      result = priceSelectedList.reduce((value, element) => value + element);
    });
    return result;
    //return pizzaPrice;
  }


  @override
  void initState() {
    //final result = selectedList.reduce((value, element) => value + element.price);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          physics: BouncingScrollPhysics(),
        children: [
          Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                alignment: Alignment.center,
                color:  Color.fromRGBO(80, 166, 132, 1),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child:
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_circle_left_outlined,size: 45.0, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: AppColors.mainColor, // <-- Button color
                          onPrimary: Colors.red,
                          // <-- Splash color
                        ),
                      )
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: LogoWidget()),
                  ]
                ),
              ),
              Image.network(
                widget.pizzaData.imageDetail,
                width: double.infinity,
                height: 300,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10.0, right: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _TitleWidget(widget: widget),
                    SizedBox(height: 10.0),
                    _DescriptionWidget(widget: widget),
                    SizedBox(height: 10.0),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(243, 243, 247, 1),
                          borderRadius: const BorderRadius.all(Radius.circular(5))
                        ),
                        child: ToggleButtons(
                            onPressed: (int index){
                              setState((){
                                for (int i = 0; i < _selectedPizzaSize.length; i++) {
                                  _selectedPizzaSize[i] = i == index;
                                  //pizzaPrice = pizzaSizePrice[i];
                                  if(_selectedPizzaSize[i] = i == index){
                                    if(priceSelectedList.contains(pizzaSizePrice[i])){
                                      priceSelectedList.add(0);
                                    } else{
                                      priceSelectedList.add(pizzaSizePrice[i]);
                                    }
                                  } else {
                                    priceSelectedList.remove(pizzaSizePrice[i]);
                                  }
                                }
                              });
                            },
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          selectedColor: Colors.black,
                          selectedBorderColor: Colors.transparent,
                          fillColor: Colors.white,
                          color: Colors.black,
                          hoverColor: Colors.black,
                          borderColor: Colors.transparent,
                          constraints: const BoxConstraints(
                            minHeight: 40.0,
                            minWidth: 120.0,
                          ),
                          isSelected: _selectedPizzaSize,
                          children: pizzaSize,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(243, 243, 247, 1),
                            borderRadius: const BorderRadius.all(Radius.circular(5))
                        ),
                        child: ToggleButtons(
                          onPressed: (int index){
                            setState((){
                              for (int i = 0; i < _selectedPizzaDough.length; i++) {
                                _selectedPizzaDough[i] = i == index;
                              }
                            });
                          },
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          selectedColor: Colors.black,
                          selectedBorderColor: Colors.transparent,
                          fillColor: Colors.white,
                          color: Colors.black,
                          hoverColor: Colors.black,
                          borderColor: Colors.transparent,
                          constraints: const BoxConstraints(
                            minHeight: 40.0,
                            minWidth: 180.0,
                          ),
                          isSelected: _selectedPizzaDough,
                          children: pizzaDough,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    _AddIngredientsTitleWidget(),
                    SizedBox(height: 15.0),
                    GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: _listOfIngredients.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.56,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 6,
                        ),
                        itemBuilder: (context, index){
                          return IngredientItem(
                              key: Key(_listOfIngredients[index].price.toString()),
                              ingredientItem: _listOfIngredients[index],
                              isSelected: (bool value) {
                                setState(() {
                                  if (value){
                                    //pizzaPrice = int.parse(widget.pizzaData.price.toString());
                                    selectedList.add(_listOfIngredients[index]);
                                    priceSelectedList.add(int.parse(_listOfIngredients[index].price.toString()));
                                  } else {
                                    selectedList.remove(_listOfIngredients[index]);
                                    priceSelectedList.remove(int.parse(_listOfIngredients[index].price.toString()));
                                  }
                                });
                              }
                          );
                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]
      ),
      bottomNavigationBar: OutlinedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(70, 70)),
            backgroundColor: MaterialStateProperty.all(Colors.red),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: BorderSide(color: Colors.red),
              ),
            )
        ),
        onPressed: (){},
        child:
        Text('В корзину за ${reduceSum()}',
          style: TextStyle(color: Colors.white,
              fontSize: 20.0),
        ),
      ),
    );
  }
}




class _AddIngredientsTitleWidget extends StatelessWidget {
  const _AddIngredientsTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Добавить в пиццу',
    style: TextStyle(
      fontSize: 18,
    ));
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Text("${widget.pizzaData.title}",
      style: TextStyle(
          color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
             );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final DetailScreen widget;

  @override
  Widget build(BuildContext context) {
    return Text("${widget.pizzaData.description}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        wordSpacing: 2.0
      ),
      textAlign: TextAlign.start,
      textWidthBasis: TextWidthBasis.longestLine,
    );
  }
}
