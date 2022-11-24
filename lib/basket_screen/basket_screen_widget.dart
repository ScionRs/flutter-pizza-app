

import 'package:flutter/material.dart';
import 'package:pizza_app/Data/ingredient_provider.dart';
import 'package:pizza_app/order_screen/order_screen_widget.dart';
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
    bool isEmpty = model.lengthProductList() > 0 ? true : false;
    return ChangeNotifierProvider(
      create: (context) => IngredientProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const _TitleWidget(),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          shrinkWrap: true,
          children: [
            isEmpty ? buildPizza(model.giveThePizzaList()) :  Container(
              height: 600,
              alignment: Alignment.center,
              child: const Text("Корзина пуста",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0)),
            ),
            isEmpty ? const Divider(thickness: 1.5) : const Text(""),
            isEmpty ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: InfoAboutProductCount(model: model),
            ) : const Text(""),
            isEmpty ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: BonusMoney(model: model),
            ) : const Text(""),
            isEmpty ? AddToFormBtn(model: model) : const Text("")


          ],
        ),
      ),
    );
  }
}

class InfoAboutProductCount extends StatelessWidget {
  const InfoAboutProductCount({
    Key? key,
    required this.model,
  }) : super(key: key);

  final IngredientProvider model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text('Количество товаров:',  style: TextStyle(color: Colors.black, fontSize: 20.0)),
        Text('${model.lengthProductList()}',  style: TextStyle(color: Colors.black, fontSize: 20.0)),
      ],
    );
  }
}

class BonusMoney extends StatelessWidget {
  const BonusMoney({
    Key? key,
    required this.model,
  }) : super(key: key);

  final IngredientProvider model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text('Начислим бонусных рублей:',  style: TextStyle(color: Colors.black, fontSize: 20.0)),
        Text('${model.bonusMoneyFromProductList()} 👍',  style: TextStyle(color: Colors.black, fontSize: 20.0)),
      ],
    );
  }
}

class AddToFormBtn extends StatelessWidget {
  const AddToFormBtn({
    Key? key,
    required this.model,
  }) : super(key: key);

  final IngredientProvider model;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(70, 70)),
          backgroundColor: MaterialStateProperty.all(Colors.red),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: Colors.red),
            ),
          )),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const OrderScreenWidget()));
      },
      child: Text(
        'Оформить за ${model.reduceProductList()} ₽',
        style: TextStyle(color: Colors.white, fontSize: 20.0),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
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
                    child: const Text('Удалить',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
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
    return Text('${pizzaItem.price.toString()} ₽',
      style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500),
    );
  }
}

Widget buildImage(String urlImage, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 0),
    color: Colors.white,
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
