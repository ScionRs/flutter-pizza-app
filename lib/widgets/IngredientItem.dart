
import 'package:flutter/material.dart';
import 'package:pizza_app/Data/ingredient_data.dart';

class IngredientItem extends StatefulWidget {
  final Key key;
  final IngredientOptionalData ingredientItem;
  final ValueChanged<bool> isSelected;

  IngredientItem({required this.key, required this.ingredientItem, required this.isSelected});
  @override
  _IngredientItem createState() => _IngredientItem();
}

class _IngredientItem extends State<IngredientItem> {
  bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Image.network(
                widget.ingredientItem.imgName,
                color: Colors.black.withOpacity(isSelected ? 0.9 : 0),
                colorBlendMode: BlendMode.color,
              ),
              isSelected
                ? Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.yellow,
                  ),
                ),
              )
                  : Container()
            ],
          )
        ],
      )
    );
  }
}
