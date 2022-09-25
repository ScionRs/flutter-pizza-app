
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/Data/ingredient_data.dart';
import 'package:pizza_app/Data/pizza_data.dart';
import 'package:pizza_app/theme/colors.dart';
import 'package:pizza_app/widgets/IngredientItem.dart';
import 'package:select_card/select_card.dart';

import '../main_screen/main_screen_widget.dart';


const List<Widget> pizzaSize = <Widget>[
  Text('Маленькая'),
  Text('Средняя'),
  Text('Верхняя'),
];

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
    imgName: 'https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA6258199C3',
    title: 'Пикантная пепперони',
    price: 79,
  ),
];



class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.pizzaData}) : super(key: key);
  final PizzaData pizzaData;


  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<bool> _selectedPizzaSize = <bool>[false,true,false];
  final List<bool> _selectedPizzaDough = <bool>[true,false];
  List<IngredientOptionalData> selectedList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                      /*OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(),
                                ),
                            )
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_left,)
                      ),*/
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
              /*Image(image: AssetImage(pizzaData.imageDetail,),
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),*/
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
                        itemCount: _listOfIngredients.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.56,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2
                        ),
                        itemBuilder: (context, index){
                          return IngredientItem(
                              key: Key(_listOfIngredients[index].price.toString()),
                              ingredientItem: _listOfIngredients[index],
                              isSelected: (bool value) {
                                setState(() {
                                  if (value){
                                    selectedList.add(_listOfIngredients[index]);
                                  } else {
                                    selectedList.remove(_listOfIngredients[index]);
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
