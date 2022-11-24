
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Data/ingredient_provider.dart';

class OrderScreenWidget extends StatelessWidget {
  const OrderScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.read<IngredientProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const _TitleButton(),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: _OrderText(model: model),
            )
          ],
        ),
      ),
    );
  }
}

class _OrderText extends StatelessWidget {
  const _OrderText({
    Key? key,
    required this.model,
  }) : super(key: key);

  final IngredientProvider model;

  @override
  Widget build(BuildContext context) {
    return Text('Сумма заказа: ${model.reduceProductList()} ₽',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
      ),);
  }
}

class _TitleButton extends StatelessWidget {
  const _TitleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Оплата и Адрес', style: TextStyle(color: Colors.black),);
  }
}
