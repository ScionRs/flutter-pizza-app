
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/personal_page/detail_page.dart';
import 'package:pizza_app/theme/colors.dart';
import 'package:pizza_app/theme/images.dart';

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

  final _listOfPizzas = [
    PizzaData(
      imageName: AppImages.pizza1,
      imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
      title: 'Мясной микс',
      description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
      price: 'от 519 ₽'
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 'от 519 ₽'
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 'от 519 ₽'
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 'от 519 ₽'
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 'от 519 ₽'
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 'от 519 ₽'
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 'от 519 ₽'
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 'от 519 ₽'
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 'от 519 ₽'
    ),
    PizzaData(
        imageName: AppImages.pizza1,
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
        title: 'Мясной микс',
        description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
        price: 'от 519 ₽'
    ),
  ];

  int _selectedTab = 0;

  void onSelectTab(int index){
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
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
        ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
          itemCount: _listOfPizzas.length,
            itemBuilder: (BuildContext context, int index){
            final pizza = _listOfPizzas[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(pizzaData: pizza),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Image(image: AssetImage(pizza.imageName),),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${pizza.title}',
                            style: TextStyle(fontSize:18, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 10,),
                          Text('${pizza.description}',
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
                            Text('${pizza.price}',
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
        ),

      ],
        ),
    );
  }
  Widget buildImage(String urlImage, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 0),
    color: Colors.grey,
    child: Image.asset(
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
