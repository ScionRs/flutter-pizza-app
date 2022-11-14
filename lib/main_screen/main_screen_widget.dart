
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/Data/ingredient_data.dart';
import 'package:pizza_app/Data/size_option.dart';
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
    MenuButtonData('Десерты'),
    MenuButtonData('Напитки'),
    MenuButtonData('Соусы'),
    MenuButtonData('Другие товары'),
  ];
  List<String> listOfPictures = [
      "https://cdn.papajohns.ru//images/banners/396ece6c32db5efbc4a7ca2f0b5bd285.jpg",
      "https://cdn.papajohns.ru//images/banners/31573ad2cc3b1f64ef793b1773320d2f.png",
  ];


  final _listOfPizzas = [
  PizzaData(
  imageName: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
  imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/95be9fd01e6b48b288e4f27e36e70ee3_183x183.png',
  title: 'Мясной микс',
  description: 'Пепперони фреш,Пикантная пепперони,увеличенная порция моцареллы,томаты,фирменный томатный соус',
  price: 0,
    category: 1,
    size: [SizeOptions(size: "маленькая", description: "25 см, традиционное тесто, 330 г", price: 289),
      SizeOptions(size: "средняя", description: "30 см, традиционное тесто, 490 г", price: 469),
      SizeOptions(size: "Большая", description: "35 см, традиционное тесто, 670 г", price: 579),],
    ingredients: [
      IngredientOptionalData(id: "1",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/cdea869ef287426386ed634e6099a5ba.png",
          title: "Сливночная моцарелла",
          price: 79),
      IngredientOptionalData(id: "2",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/370dac9ed21e4bffaf9bc2618d258734.png",
          title: "Итальянские травы",
          price: 39),
      IngredientOptionalData(id: "3",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA61B9A8D61",
          title: "Ветчина",
          price: 79),
      IngredientOptionalData(id: "4",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/b2f3a5d5afe44516a93cfc0d2ee60088.png",
          title: "Митболы",
          price: 79),
      IngredientOptionalData(id: "6",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA6258199C3",
          title: "Пикантная пепперони",
          price: 79),
      IngredientOptionalData(id: "7",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA62D5D6027",
          title: "Острая чоризо",
          price: 79),
      IngredientOptionalData(id: "8",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA6B0FFC349",
          title: "Кубики брынзы",
          price: 79),
      IngredientOptionalData(id: "9",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA67259A324",
          title: "Шампиньоны",
          price: 59),
      IngredientOptionalData(id: "10",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA63F774C1B",
          title: "Сладкий перец",
          price: 59),
      IngredientOptionalData(id: "11",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA60AE6464C",
          title: "Красный лук",
          price: 59),
      IngredientOptionalData(id: "12",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A21DA51A81211E9AFA6795BA2A0",
          title: "Сочные ананасы",
          price: 59),
      IngredientOptionalData(id: "13",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/46889eeb335b4bf18d7a565f4fbc9588.png",
          title: "Острый халапенью",
          price: 59),
      IngredientOptionalData(id: "14",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A21DA51A81211E9EA89958D782B",
          title: "Маринованные огурчики",
          price: 59),
      IngredientOptionalData(id: "15",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA7AC1A1D67",
          title: "Свежие томаты",
          price: 59),
      IngredientOptionalData(id: "16",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA637AAB68F",
          title: "Хрустящий бекон",
          price: 79),
      IngredientOptionalData(id: "17",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA60AE6464C",
          title: "Чеддер и пармезан",
          price: 79),
      IngredientOptionalData(id: "18",
          imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/bd896a42a5b44169ae9dfdc2573c34f2.png",
          title: "Сырный бортик",
          price: 179),
    ]
  ),
    PizzaData(
        imageName: 'https://cdn.dodostatic.net/static/Img/Products/c1b205fe56e54b60a17911e5ae3ba7c3_183x183.png',
        imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/c1b205fe56e54b60a17911e5ae3ba7c3_183x183.png',
        title: 'Сырная',
        description: 'Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо',
        price: 0,
        category: 1,
        size: [SizeOptions(size: "маленькая", description: "25 см, традиционное тесто, 330 г", price: 289),
          SizeOptions(size: "средняя", description: "30 см, традиционное тесто, 490 г", price: 469),
          SizeOptions(size: "Большая", description: "35 см, традиционное тесто, 670 г", price: 579),
        ],
        ingredients: [
          IngredientOptionalData(id: "1",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/cdea869ef287426386ed634e6099a5ba.png",
            title: "Сливночная моцарелла",
            price: 79),
          IngredientOptionalData(id: "2",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/370dac9ed21e4bffaf9bc2618d258734.png",
              title: "Итальянские травы",
              price: 39),
          IngredientOptionalData(id: "3",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA61B9A8D61",
              title: "Ветчина",
              price: 79),
          IngredientOptionalData(id: "4",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/b2f3a5d5afe44516a93cfc0d2ee60088.png",
              title: "Митболы",
              price: 79),
          IngredientOptionalData(id: "6",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA6258199C3",
              title: "Пикантная пепперони",
              price: 79),
          IngredientOptionalData(id: "7",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA62D5D6027",
              title: "Острая чоризо",
              price: 79),
          IngredientOptionalData(id: "8",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA6B0FFC349",
              title: "Кубики брынзы",
              price: 79),
          IngredientOptionalData(id: "9",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA67259A324",
              title: "Шампиньоны",
              price: 59),
          IngredientOptionalData(id: "10",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA63F774C1B",
              title: "Сладкий перец",
              price: 59),
          IngredientOptionalData(id: "11",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA60AE6464C",
              title: "Красный лук",
              price: 59),
          IngredientOptionalData(id: "12",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A21DA51A81211E9AFA6795BA2A0",
              title: "Сочные ананасы",
              price: 59),
          IngredientOptionalData(id: "13",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/46889eeb335b4bf18d7a565f4fbc9588.png",
              title: "Острый халапенью",
              price: 59),
          IngredientOptionalData(id: "14",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A21DA51A81211E9EA89958D782B",
              title: "Маринованные огурчики",
              price: 59),
          IngredientOptionalData(id: "15",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA7AC1A1D67",
              title: "Свежие томаты",
              price: 59),
          IngredientOptionalData(id: "16",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA637AAB68F",
              title: "Хрустящий бекон",
              price: 79),
          IngredientOptionalData(id: "17",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA60AE6464C",
              title: "Чеддер и пармезан",
              price: 79),
          IngredientOptionalData(id: "18",
              imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/bd896a42a5b44169ae9dfdc2573c34f2.png",
              title: "Сырный бортик",
              price: 179),
        ],
    ),
    PizzaData(
      imageName: 'https://cdn.dodostatic.net/static/Img/Products/06c75b36952747a694a169662cb3267b_183x183.png',
      imageDetail: 'https://cdn.dodostatic.net/static/Img/Products/06c75b36952747a694a169662cb3267b_183x183.png',
      title: 'Ветчина и сыр',
      description: 'Ветчина, моцарелла, фирменный соус альфредо',
      price: 0,
      category: 1,
      size: [SizeOptions(size: "маленькая", description: "25 см, традиционное тесто, 330 г", price: 289),
        SizeOptions(size: "средняя", description: "30 см, традиционное тесто, 490 г", price: 469),
        SizeOptions(size: "Большая", description: "35 см, традиционное тесто, 670 г", price: 579),
      ],
      ingredients: [
        IngredientOptionalData(id: "1",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/cdea869ef287426386ed634e6099a5ba.png",
            title: "Сливночная моцарелла",
            price: 79),
        IngredientOptionalData(id: "2",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/370dac9ed21e4bffaf9bc2618d258734.png",
            title: "Итальянские травы",
            price: 39),
        IngredientOptionalData(id: "3",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA61B9A8D61",
            title: "Ветчина",
            price: 79),
        IngredientOptionalData(id: "4",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/b2f3a5d5afe44516a93cfc0d2ee60088.png",
            title: "Митболы",
            price: 79),
        IngredientOptionalData(id: "6",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA6258199C3",
            title: "Пикантная пепперони",
            price: 79),
        IngredientOptionalData(id: "7",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA62D5D6027",
            title: "Острая чоризо",
            price: 79),
        IngredientOptionalData(id: "8",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA6B0FFC349",
            title: "Кубики брынзы",
            price: 79),
        IngredientOptionalData(id: "9",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA67259A324",
            title: "Шампиньоны",
            price: 59),
        IngredientOptionalData(id: "10",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA63F774C1B",
            title: "Сладкий перец",
            price: 59),
        IngredientOptionalData(id: "11",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA60AE6464C",
            title: "Красный лук",
            price: 59),
        IngredientOptionalData(id: "12",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A21DA51A81211E9AFA6795BA2A0",
            title: "Сочные ананасы",
            price: 59),
        IngredientOptionalData(id: "13",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/46889eeb335b4bf18d7a565f4fbc9588.png",
            title: "Острый халапенью",
            price: 59),
        IngredientOptionalData(id: "14",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A21DA51A81211E9EA89958D782B",
            title: "Маринованные огурчики",
            price: 59),
        IngredientOptionalData(id: "15",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA7AC1A1D67",
            title: "Свежие томаты",
            price: 59),
        IngredientOptionalData(id: "16",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A39D824A82E11E9AFA637AAB68F",
            title: "Хрустящий бекон",
            price: 79),
        IngredientOptionalData(id: "17",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/000D3A22FA54A81411E9AFA60AE6464C",
            title: "Чеддер и пармезан",
            price: 79),
        IngredientOptionalData(id: "18",
            imgName: "https://cdn.dodostatic.net/static/Img/Ingredients/bd896a42a5b44169ae9dfdc2573c34f2.png",
            title: "Сырный бортик",
            price: 179),
      ],
    ),
    PizzaData(imageName: "https://cdn.dodostatic.net/static/Img/Products/b85a6725e61144dbb54ed3f918fc68c1_183x183.png",
        imageDetail: "https://cdn.dodostatic.net/static/Img/Products/b85a6725e61144dbb54ed3f918fc68c1_183x183.png",
        title: "Додстер Карри",
        description: "Горячая закуска с цыпленком, ананасом, сладким перцем, моцареллой и пряным соусом карри в тонкой пшеничной лепешке",
        price: 189,
        category: 2,
        size: [],
        ingredients: []),
    PizzaData(imageName: "https://cdn.dodostatic.net/static/Img/Products/93add58319a84824b8618a6a34b9ef60_183x183.png",
        imageDetail: "https://cdn.dodostatic.net/static/Img/Products/93add58319a84824b8618a6a34b9ef60_183x183.png",
        title: "Додстер",
        description: "Легендарная горячая закуска с цыпленком, томатами, моцареллой, соусом ранч в тонкой пшеничной лепешке",
        price: 169,
        category: 2,
        size: [],
        ingredients: []),
    PizzaData(imageName: "https://cdn.dodostatic.net/static/Img/Products/14afcd3cc7094ee49a8b71953ef9f777_183x183.jpeg",
        imageDetail: "https://cdn.dodostatic.net/static/Img/Products/14afcd3cc7094ee49a8b71953ef9f777_183x183.jpeg",
        title: "Острый Додстер 🌶️🌶️",
        description: "Горячая закуска с цыпленком, перчиком халапеньо, маринованными огурчиками, томатами, моцареллой и соусом барбекю в тонкой пшеничной лепешке",
        price: 169,
        category: 2,
        size: [],
        ingredients: []),
  ];

  int _selectedTab = 0;

  void onSelectTab(int index){
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

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
                return buildPizza(_listOfPizzas);
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
                        Text('${pizzaItem.size[0].price.toString()}',
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
    color: Colors.white,
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
