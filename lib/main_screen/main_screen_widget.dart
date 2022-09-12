
import 'package:flutter/material.dart';
import 'package:pizza_app/theme/images.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
          _MenuButtonListWidget(menuButton: listOfCategories)
        ],
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
            color: Color.fromRGBO(80, 166, 132, 1),
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
