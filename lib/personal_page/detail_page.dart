import 'package:flutter/material.dart';
import 'package:pizza_app/Data/ingredient_data.dart';
import 'package:pizza_app/Data/ingredient_provider.dart';
import 'package:pizza_app/Data/pizza_data.dart';
import 'package:pizza_app/Data/size_option.dart';
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


class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.pizzaData}) : super(key: key);
  final PizzaData pizzaData;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<bool> _selectedPizzaSize = <bool>[false,true,false]; // Размер пиццы
  List<IngredientOptionalData> selectedList = [];
  List<int> priceSelectedList = [0]; // добавляю 1 или получаю BadState
  List<SizeOptions> listSize = [];
  int result = 0;
  int pizzaPrice = 0;
  late PizzaData newPizzaData;


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


  PizzaData selectPizzaData(){
    setState(() {
      newPizzaData = PizzaData(imageName: widget.pizzaData.imageName,
          imageDetail: widget.pizzaData.imageDetail,
          title: widget.pizzaData.title,
          description: widget.pizzaData.description,
          price: reduceSum(),
          size: listSize,
          ingredients: selectedList);
    });
    return newPizzaData;
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
                                for (int i = 0; i < widget.pizzaData.size.length; i++) {
                                  _selectedPizzaSize[i] = i == index;
                                  //pizzaPrice = pizzaSizePrice[i];
                                  if(_selectedPizzaSize[i] = i == index){
                                    if(priceSelectedList.contains(widget.pizzaData.size[i].price)){
                                      priceSelectedList.add(0);
                                    } else{
                                      listSize.add(widget.pizzaData.size[i]);
                                      priceSelectedList.add(widget.pizzaData.size[i].price);
                                    }
                                  } else {
                                    priceSelectedList.remove(widget.pizzaData.size[i].price);
                                    listSize.remove(widget.pizzaData.size[i]);
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
                    SizedBox(height: 15.0),
                    _AddIngredientsTitleWidget(),
                    SizedBox(height: 15.0),
                    GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount:  widget.pizzaData.ingredients.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.56,
                            crossAxisSpacing: 6,
                            mainAxisSpacing: 6,
                        ),
                        itemBuilder: (context, index){
                          return IngredientItem(
                              key: Key(widget.pizzaData.ingredients[index].price.toString()),
                              ingredientItem: widget.pizzaData.ingredients[index],
                              isSelected: (bool value) {
                                setState(() {
                                  if (value){
                                    //pizzaPrice = int.parse(widget.pizzaData.price.toString());
                                    selectedList.add(widget.pizzaData.ingredients[index]);
                                    priceSelectedList.add(int.parse(widget.pizzaData.ingredients[index].price.toString()));
                                  } else {
                                    selectedList.remove(widget.pizzaData.ingredients[index]);
                                    priceSelectedList.remove(int.parse(widget.pizzaData.ingredients[index].price.toString()));
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
        onPressed: (){
          print(selectPizzaData());
        },
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
