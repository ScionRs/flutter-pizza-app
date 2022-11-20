
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/Data/common_data.dart';
import 'package:pizza_app/Data/ingredient_data.dart';
import 'package:pizza_app/Data/size_option.dart';
import 'package:pizza_app/personal_page/detail_page.dart';
import 'package:pizza_app/theme/colors.dart';
import 'package:pizza_app/theme/images.dart';
import 'package:http/http.dart' as http;

import '../Data/pizza_data.dart';


class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  List<MenuButtonData> listOfCategories = [
    MenuButtonData('Пицца'),
    MenuButtonData('Закуски'),
    MenuButtonData('Десерты'),
    MenuButtonData('Напитки'),
    MenuButtonData('Соусы'),
    MenuButtonData('Другие товары'),
  ];
  List<String> listOfPictures = [
    "https://cdn.papajohns.ru//images/banners/396ece6c32db5efbc4a7ca2f0b5bd285.jpg",
    "https://cdn.papajohns.ru//images/banners/31573ad2cc3b1f64ef793b1773320d2f.png",
  ];


  // Преобразовать данные из json
  List<PizzaData> allPizzasFromJson(String str) {
    final jsonData = json.decode(str);
    return List<PizzaData>.from(jsonData.map((x) => PizzaData.fromJson(x)));
  }

  // Получить все пиццы(продукты) с сервера
  Future<List<PizzaData>> getAllPizzas() async {
    final response = await http.get(Uri.parse('http://localhost:3000/pizza'));
    print(response.body);
    return allPizzasFromJson(response.body);
  }

  var _filterProductList = <PizzaData>[];

  final _searchController = TextEditingController();

  // Поиск продукта по title параметру
  void _searchProduct() {
    final query = _searchController.text;

    if (query.isNotEmpty) {
      _filterProductList = CommonData.listOfPizzas.where((PizzaData product) {
        return product.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    else {
      _filterProductList = CommonData.listOfPizzas;
    }
    setState(() {

    });
  }


  @override
  void initState() {
    super.initState();
    _filterProductList = CommonData.listOfPizzas;
    _searchController.addListener(_searchProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        shrinkWrap: true,
        children: [
          Container(
            height: 60,
            width: double.infinity,
            alignment: Alignment.center,
            color: const Color.fromRGBO(80, 166, 132, 1),
            child: const Center(
              child: LogoWidget(),
            ),
          ),
          _MenuButtonListWidget(menuButton: listOfCategories),
          _CarouselWidget(),
          _SearchWidget(textEditingController: _searchController,),
          FutureBuilder<List<PizzaData>>(
              future: getAllPizzas(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return buildPizza(_filterProductList);
                }
                if (snapshot.hasData) {
                  List<PizzaData> products = snapshot.data!;
                  return buildPizza(products);
                } else {
                  return const Text('Загрузка...');
                }
              }),
        ],
      ),
    );
  }

  // Виджет карусели
  Widget _CarouselWidget() =>
      CarouselSlider.builder(
        options: CarouselOptions(
          viewportFraction: 1,
          height: 350,
          autoPlay: true,
        ),
        itemCount: listOfPictures.length,
        itemBuilder: (context, index, realIndex) {
          final urlImage = listOfPictures[index];
          return buildImage(urlImage, index);
        },
      );

  /*
  * Виджет пиццы
  * Входное значение: Список пицц(продуктов)
  * */
  Widget buildPizza(List<PizzaData> pizza) => ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: pizza.length,
      itemBuilder: (BuildContext context, int index){
        final pizzaItem = pizza[index];
        return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(pizzaData: pizzaItem),
                  ));
            },
            child: Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                buildImage(pizzaItem.imageName, index),
                const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$pizzaItem.title',
                        style: const TextStyle(fontSize:18, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,),
                      const SizedBox(height: 10,),
                      Text('$pizzaItem.description',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,),
                      const SizedBox(height: 5,),
                      OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: const BorderSide(color: Colors.red),
                              ),
                            )
                        ),
                        onPressed: (){},
                        child:
                        Text('$pizzaItem.size[0].price.toString()',
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
        ),
        );
      }
  );

  // Виджет изображения
  Widget buildImage(String urlImage, int index) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 0),
    color: Colors.white,
    child: Image.network(
      urlImage,
      fit: BoxFit.cover,
    )
  );
}

// Виджет поиска
class _SearchWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  const _SearchWidget({
    Key? key,
    required this.textEditingController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: textEditingController,
        cursorColor: AppColors.mainColor,
        decoration: InputDecoration(
          labelText: 'Поиск',
          labelStyle: const TextStyle(color: AppColors.mainColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: AppColors.mainColor,
                width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: AppColors.mainColor,
                width: 2.0,
              )
          ),
        ),
      ),
    );
  }
}

class _MenuButtonWidget extends StatelessWidget {
  final MenuButtonData menuButtonData;

  _MenuButtonWidget({Key? key, required this.menuButtonData}) : super(key: key);

  final btnStyle = ButtonStyle(
    alignment: Alignment.center,
    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    side: MaterialStateProperty.all(
        const BorderSide(color: Colors.transparent,
        )
    ),
  );
  @override
  Widget build(BuildContext context) {
    return  OutlinedButton(
        style: btnStyle,
        onPressed: () {},
        child: Text('$menuButtonData.title'.toUpperCase(),
          style: const TextStyle(
            color: AppColors.mainColor,
            fontSize: 16,
          ),
        )
    );
  }
}

class MenuButtonData{
  String title;

  MenuButtonData(this.title);
}

class _MenuButtonListWidget extends StatelessWidget {
  final List<MenuButtonData> menuButton;

  const _MenuButtonListWidget({Key? key, required this.menuButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: menuButton.map((data) => _MenuButtonWidget(menuButtonData: data)).toList(),
      ),
    );
  }
}

// Виджет логотипа
class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
         Text('Pizza',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text('<',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Image(image: AppImages.logo),
        Text('>',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text('Hub',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            )
        ),
        ],
    );
  }
}
