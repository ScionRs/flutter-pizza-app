
import 'package:pizza_app/Data/pizza_data.dart';
import 'package:pizza_app/Data/size_option.dart';

import 'ingredient_data.dart';

class CommonData{
  static final listOfPizzas = [
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
        price: 0,
        category: 2,
        size: [SizeOptions(size: "", description: "180 г", price: 189),],
        ingredients: []),
    PizzaData(imageName: "https://cdn.dodostatic.net/static/Img/Products/93add58319a84824b8618a6a34b9ef60_183x183.png",
        imageDetail: "https://cdn.dodostatic.net/static/Img/Products/93add58319a84824b8618a6a34b9ef60_183x183.png",
        title: "Додстер",
        description: "Легендарная горячая закуска с цыпленком, томатами, моцареллой, соусом ранч в тонкой пшеничной лепешке",
        price: 0,
        category: 2,
        size: [SizeOptions(size: "", description: "200 г", price: 169),],
        ingredients: []),
    PizzaData(imageName: "https://cdn.dodostatic.net/static/Img/Products/14afcd3cc7094ee49a8b71953ef9f777_183x183.jpeg",
        imageDetail: "https://cdn.dodostatic.net/static/Img/Products/14afcd3cc7094ee49a8b71953ef9f777_183x183.jpeg",
        title: "Острый Додстер 🌶️🌶️",
        description: "Горячая закуска с цыпленком, перчиком халапеньо, маринованными огурчиками, томатами, моцареллой и соусом барбекю в тонкой пшеничной лепешке",
        price: 0,
        category: 2,
        size: [SizeOptions(size: "", description: "190 г", price: 169),],
        ingredients: []),
  ];
}