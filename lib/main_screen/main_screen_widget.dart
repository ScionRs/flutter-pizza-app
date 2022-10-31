
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/api/api_client.dart';
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
    MenuButtonData('Напитки'),
    MenuButtonData('Соусы'),
    MenuButtonData('Десерты'),
    MenuButtonData('Горячее'),
    MenuButtonData('Комбо'),
    MenuButtonData('Салаты'),
    MenuButtonData('Веган'),
  ];
  List<String> listOfPictures = [
      AppImages.event1,
      AppImages.event2,
      AppImages.event3,
  ];

  /*
  final _listOfPizzas = [
    PizzaData(
      imageName: AppImages.pizza1,
      imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
      title: 'Мясной микс',
      description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
      price: 519
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 519
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 519
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 519
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 519
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 519
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 519
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 519
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 519
    ),
  ];
*/

  int _selectedTab = 0;

  void onSelectTab(int index){
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  /*
   Future<List<PizzaData>> getPizzas() async {
    List<PizzaData> products = [];
    final response = await http.get(Uri.parse('http://localhost:3000/pizza'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      products = data.map((e) => PizzaData.fromJson(e)).toList();
      return products;
    } else {
      products = data.map((e) => PizzaData.fromJson(e)).toList();
      return products;
    }
  }
  */

  List<PizzaData> allPizzasFromJson(String str) {
    final jsonData = json.decode(str);
    print(jsonData);
    print(new List<PizzaData>.from(jsonData.map((x) => PizzaData.fromJson(x))));
    return new List<PizzaData>.from(jsonData.map((x) => PizzaData.fromJson(x)));
  }

  Future<List<PizzaData>> getAllPizzas() async {
    final response = await http.get(Uri.parse('http://localhost:3000/pizza'));
    print(response.body);
    return allPizzasFromJson(response.body);
  }

  //final Future<List<PizzaData>> _listOfPizzas = ApiClient().getPizzas();



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
        color:  Color.fromRGBO(80, 166, 132, 1),
        child: Center(
          child: LogoWidget(),
        ),
        ),
        _MenuButtonListWidget(menuButton: listOfCategories),
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
    ),
        _SearchWidget(),
        FutureBuilder<List<PizzaData>>(
            future: getAllPizzas(),
            builder: (context, snapshot){
              if(snapshot.hasError){
                return Text('Error: ${snapshot.error} - ${snapshot.stackTrace}');
              }
              if(snapshot.hasData){
                //return Text('${snapshot.data![0].title} ${snapshot.data![0].size[0].size} ${snapshot.data![0].ingredients[0].title}');
                List<PizzaData> products = snapshot.data!;
                return buildPizza(products);
              } else {
                return Text('Loading');
              }

              /*
              if (snapshot.hasData) {
                List<PizzaData> products = snapshot.data;
                print(products);
                return buildPizza(products);
              } else {
                return const Text("Ошибка соединения");
              }
               */
            }),
      ],
        ),
    );
  }


  Widget buildPizza(List<PizzaData> pizza) => ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
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
                //Image(pizzaItem.imageName),
                buildImage(pizzaItem.imageName, index),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${pizzaItem.title}',
                        style: TextStyle(fontSize:18, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 10,),
                      Text('${pizzaItem.description}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 5,),
                      OutlinedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(color: Colors.red),
                              ),
                            )
                        ),
                        onPressed: (){},
                        child:
                        Text('${pizzaItem.price.toString()}',
                          style: TextStyle(color: Colors.white),
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


  Widget buildImage(String urlImage, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 0),
    color: Colors.grey,
    child: Image.network(
      urlImage,
      fit: BoxFit.cover,
    )
  );
}

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        cursorColor: AppColors.mainColor,
        decoration: InputDecoration(
          labelText: 'Поиск',
          labelStyle: TextStyle(color: AppColors.mainColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                color: AppColors.mainColor,
                width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
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
        BorderSide(color: Colors.transparent,
        )
    ),
  );
  @override
  Widget build(BuildContext context) {
    return  OutlinedButton(
        style: btnStyle,
        onPressed: () {},
        child: Text('${menuButtonData.title}'.toUpperCase(),
          style: TextStyle(
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
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: menuButton.map((data) => _MenuButtonWidget(menuButtonData: data)).toList(),
      ),
    );
  }
}


/*
 SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
               OutlinedButton(
                   style: btnStyle,
                   onPressed: () {},
                   child: Text('Пицца'.toUpperCase(),
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: 16,
                   ),
                   )
               ),
            ],
            ),
          )
 */

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
