
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/Data/pizza_data.dart';
import 'package:pizza_app/theme/colors.dart';

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

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.pizzaData}) : super(key: key);
  final PizzaData pizzaData;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final List<bool> _selectedPizzaSize = <bool>[false,true,false];
  final List<bool> _selectedPizzaDough = <bool>[true,false];

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
