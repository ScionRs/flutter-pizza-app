

import 'package:flutter/material.dart';
import 'package:pizza_app/Data/ingredient_provider.dart';
import 'package:provider/provider.dart';

import '../Data/pizza_data.dart';

class BasketScreenWidget extends StatefulWidget {
  const BasketScreenWidget({Key? key}) : super(key: key);

  @override
  _BasketScreenWidget createState() => _BasketScreenWidget();
}

class _BasketScreenWidget extends State<BasketScreenWidget> {
  @override
  Widget build(BuildContext context) {
    var model = context.read<IngredientProvider>();
    return ChangeNotifierProvider(
      create: (context) => IngredientProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: _TitleWidget(),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          shrinkWrap: true,
          children: [
              buildPizza(model.giveThePizzaList()),
          ],
        ),
      ),
    );
  }
}

Widget buildPizza(List<PizzaData> pizza) => ListView.builder(
    shrinkWrap: true,
    physics: BouncingScrollPhysics(),
    itemCount: pizza.length,
    itemBuilder: (BuildContext context, int index){
      final pizzaItem = pizza[index];
      return Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        child: Column(
          children: [
            Row(
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
                      Text('${pizzaItem.size.join(',')}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,),
                      Text('${pizzaItem.ingredients.join(',')}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 5,)
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _PriceButton(pizzaItem: pizzaItem),

                OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(color: Colors.red),
                        ),
                      )),
                  onPressed: () {},
                  child: Text('Удалить',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
);

class _PriceButton extends StatelessWidget {
  const _PriceButton({
    Key? key,
    required this.pizzaItem,
  }) : super(key: key);

  final PizzaData pizzaItem;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: Colors.white),
            ),
          )
      ),
      onPressed: (){},
      child:
      Text('${pizzaItem.size[0].price.toString()} ₽',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

Widget buildImage(String urlImage, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 0),
    color: Colors.grey,
    child: Image.network(
      urlImage,
      fit: BoxFit.cover,
    )
);


class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Корзина", style: TextStyle(color: Colors.black),);
  }
}
