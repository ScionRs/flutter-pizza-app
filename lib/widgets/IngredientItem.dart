
import 'package:flutter/material.dart';
import 'package:pizza_app/Data/ingredient_data.dart';
import 'package:pizza_app/Data/ingredient_provider.dart';
import 'package:provider/provider.dart';

/*
class IngredientItem extends StatelessWidget {
  final Key key;
  final IngredientOptionalData ingredientItem;
  final ValueChanged<bool> isSelected;

  IngredientItem({required this.key, required this.ingredientItem, required this.isSelected});

  bool isClick = false;
  List<int> priceSelectList = [];
  int resultIngredientPrice = 0;



  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: (){
            isClick = !isClick;
            widget.isSelected(isSelected);

        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: isSelected ? Border.all(color: Colors.yellow, width: 1.5) : Border.all(color: Colors.transparent,  width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
          ),
          child: Column(
            children: [
              OutlinedButton(onPressed: (){
              }, child: child)
              Stack(
                children: <Widget>[
                  Image.network(
                    widget.ingredientItem.imgName,
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
                      : Container(),

                ],
              ),
              Text('${widget.ingredientItem.title}',textAlign: TextAlign.center,),
              SizedBox(height: 10.0,),
              Text('${widget.ingredientItem.price} ₽', textAlign: TextAlign.center,),
            ],
          ),
        )
    );
  }
}
*/

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
  List<int> priceSelectList = [];
  int resultIngredientPrice = 0;



  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          setState(() {
            isSelected = !isSelected;
            widget.isSelected(isSelected);
          });
              //var rel =  context.read<IngredientProvider>().addToList(widget.ingredientItem.price);
          var rel =  context.read<IngredientProvider>();
          rel.addToList(widget.ingredientItem.price);

        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: isSelected ? Border.all(color: Colors.yellow, width: 1.5) : Border.all(color: Colors.transparent,  width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(4, 8), // Shadow position
              ),
            ],
          ),
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Image.network(
                    widget.ingredientItem.imgName,
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
                      : Container(),

                ],
              ),
              Text('${widget.ingredientItem.title}',textAlign: TextAlign.center,),
              SizedBox(height: 10.0,),
              Text('${widget.ingredientItem.price} ₽', textAlign: TextAlign.center,),
            ],
          ),
        )
    );
  }
}




