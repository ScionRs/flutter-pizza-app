import 'package:flutter/material.dart';
import 'package:pizza_app/Data/ingredient_data.dart';
import 'package:pizza_app/Data/ingredient_provider.dart';
import 'package:pizza_app/Data/pizza_data.dart';
import 'package:pizza_app/Data/size_option.dart';
import 'package:pizza_app/router_screen/router_screen.dart';
import 'package:pizza_app/theme/colors.dart';
import 'package:pizza_app/widgets/IngredientItem.dart';
import '../main_screen/main_screen_widget.dart';
import 'package:provider/provider.dart';

//Список для виджета ToggleButtons
const List<Widget> pizzaSize = <Widget>[
  Text('Маленькая'),
  Text('Средняя'),
  Text('Большая'),
];


class DetailScreen extends StatefulWidget {
 const DetailScreen({Key? key, required this.pizzaData}) : super(key: key);
  final PizzaData pizzaData;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<bool> _selectedPizzaSize = <bool>[false,true,false]; // логическое состояние для выбранной кнопки
  List<IngredientOptionalData> selectedList = []; // выбранные ингредиенты
  List<int> priceSelectedList = [0]; // инициализация начальным значением или получаю BadState
  List<SizeOptions> listSize = []; // Список для выбора размера пиццы или продукта
  int result = 0; // сумма заказа
  late PizzaData newPizzaData; // Обьект для нового заказа

  // Метод для суммирования всего заказа
  int reduceSum(){
    setState(() {
      result = priceSelectedList.reduce((value, element) => value + element);
    });
    return result;
  }

  // Формирование заказа на основе выбора пользователя
  PizzaData selectPizzaData(){
    setState(() {
      newPizzaData = PizzaData(imageName: widget.pizzaData.imageName,
          imageDetail: widget.pizzaData.imageDetail,
          title: widget.pizzaData.title,
          description: widget.pizzaData.description,
          price: reduceSum(),
          size: listSize,
          category: widget.pizzaData.category,
          ingredients: selectedList);
    });
    return newPizzaData;
  }

  /*
    Если пользователь не сделал конкретный выбор,
    добавляем пиццу по умолчанию
   */
  PizzaData defaultSelectedProduct(){
    setState(() {
      newPizzaData = PizzaData(imageName: widget.pizzaData.imageName,
          imageDetail: widget.pizzaData.imageDetail,
          title: widget.pizzaData.title,
          description: widget.pizzaData.description,
          price: widget.pizzaData.size[0].price,
          category: widget.pizzaData.category,
          size: widget.pizzaData.size,
          ingredients: []);
    });
    return newPizzaData;
  }


  @override
  Widget build(BuildContext context) {
    var model = context.read<IngredientProvider>();
    bool isDataSize = widget.pizzaData.dataSumSizeElements() > 1 ? true : false;
    bool checkReduceSum = reduceSum() > 0 ? true : false;
    return ChangeNotifierProvider(
        create: (context) => IngredientProvider(),
        child: Scaffold(
          body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    alignment: Alignment.center,
                    color: const Color.fromRGBO(80, 166, 132, 1),
                    child: Stack(alignment: Alignment.center, children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_circle_left_outlined,
                                size: 45.0, color: Colors.white),
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              primary: AppColors.mainColor,
                              onPrimary: Colors.red,
                            ),
                          )),
                      const Align(alignment: Alignment.center, child: LogoWidget()),
                    ]),
                  ),
                  Image.network(
                    widget.pizzaData.imageDetail,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 10.0, right: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _TitleWidget(widget: widget),
                        const SizedBox(height: 10.0),
                        _DescriptionWidget(widget: widget),
                        const SizedBox(height: 10.0),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(243, 243, 247, 1),
                                borderRadius:
                                 BorderRadius.all(Radius.circular(5))),
                            child: isDataSize ? ToggleButtons(
                              onPressed: (int index) {
                                setState(() {
                                  for (int i = 0;
                                      i < widget.pizzaData.size.length;
                                      i++) {
                                    _selectedPizzaSize[i] = i == index;
                                    if (_selectedPizzaSize[i] = i == index) {
                                      if (priceSelectedList.contains(
                                          widget.pizzaData.size[i].price)) {
                                        priceSelectedList.add(0);
                                      } else {
                                        listSize.add(widget.pizzaData.size[i]);
                                        priceSelectedList.add(
                                            widget.pizzaData.size[i].price);
                                      }
                                    } else {
                                      priceSelectedList.remove(
                                          widget.pizzaData.size[i].price);
                                      listSize.remove(widget.pizzaData.size[i]);
                                    }
                                  }
                                });
                              },
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
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
                            ) : const Text(""),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        isDataSize ? const _AddIngredientsTitleWidget() : const Text(""),
                        const SizedBox(height: 15.0),
                        GridView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: widget.pizzaData.ingredients.length,
                            gridDelegate:
                               const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.56,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 6,
                            ),
                            itemBuilder: (context, index) {
                              return IngredientItem(
                                  key: Key(widget
                                      .pizzaData.ingredients[index].price
                                      .toString()),
                                  ingredientItem:
                                      widget.pizzaData.ingredients[index],
                                  isSelected: (bool value) {
                                    setState(() {
                                      if (value) {
                                        selectedList.add(widget
                                            .pizzaData.ingredients[index]);
                                        priceSelectedList.add(int.parse(widget
                                            .pizzaData.ingredients[index].price
                                            .toString()));
                                      } else {
                                        selectedList.remove(widget
                                            .pizzaData.ingredients[index]);
                                        priceSelectedList.remove(int.parse(
                                            widget.pizzaData.ingredients[index]
                                                .price
                                                .toString()));
                                      }
                                    });
                                  });
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
          bottomNavigationBar: OutlinedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(70, 70)),
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shape: MaterialStateProperty.all(
                 const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.red),
                  ),
                )),
            onPressed: () {
              if(reduceSum() > 0) {
                model.addToPizzaDataList(selectPizzaData());
                print(selectPizzaData());
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const RouterScreenWidget()));
              } else{
                model.addToPizzaDataList(defaultSelectedProduct());
                print(selectPizzaData());
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>  const RouterScreenWidget()));
              }
            },
            child: checkReduceSum ? Text(
              'В корзину за ${reduceSum()}',
              style: const TextStyle(color: Colors.white, fontSize: 20.0),
            ) : Text('В корзину за ${widget.pizzaData.size[0].price}',
              style: const TextStyle(color: Colors.white, fontSize: 20.0),),
          ),
        ));
  }
}




class _AddIngredientsTitleWidget extends StatelessWidget {
  const _AddIngredientsTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Добавить в пиццу',
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
      style: const TextStyle(
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
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
        wordSpacing: 2.0
      ),
      textAlign: TextAlign.start,
      textWidthBasis: TextWidthBasis.longestLine,
    );
  }
}
