
import 'package:flutter/material.dart';
import 'package:pizza_app/Data/pizza_data.dart';

import '../main_screen/main_screen_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.pizzaData}) : super(key: key);

  final PizzaData pizzaData;

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
                      child: OutlinedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_left)
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: LogoWidget()),
                  ]
                ),
              ),
              Image(image: AssetImage(pizzaData.imageName,),
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ]
      ),
    );
  }
}
