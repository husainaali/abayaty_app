import 'package:flutter/material.dart';

import '../../services/base_model.dart';

class HomePageViewModel extends BaseModel {
  List<String> catList = [
    "All",
    "New Collection",
    "Eid Collection",
    "Summer",
    "Offers"
  ];
  int selectedCat = 0;

  int itemQty = 1;

  final List<Color> colors = [
    Color(0xFF352424),
    Color(0xFF2D3816),
    Color(0xFF152E36),
    Color(0xFF36091E),
    Color(0xFFA59D9D),
    Color(0xFF000000),
  ];
  final List<String> sizes = ["XS", "S", "M", "L", "XL", "XXL"];

  final List<Image> accessories = [
    Image.asset("assets/acc1.png", fit: BoxFit.cover),
    Image.asset("assets/acc2.png", fit: BoxFit.cover),
    Image.asset("assets/acc3.png", fit: BoxFit.cover),
    Image.asset("assets/acc4.png", fit: BoxFit.cover),
    Image.asset("assets/acc5.png", fit: BoxFit.cover),
    Image.asset("assets/acc6.png", fit: BoxFit.cover),
    Image.asset("assets/acc7.png", fit: BoxFit.cover),
    Image.asset("assets/acc8.png", fit: BoxFit.cover),
    Image.asset("assets/acc9.png", fit: BoxFit.cover),
    Image.asset(
      "assets/acc10.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/acc11.png",
      fit: BoxFit.cover,
    ),
  ];

  initialize() {}
  initializeDetailsPage() {}

  itemQtyCounter(requestName) {
    if (requestName == "+") {
      if (itemQty < 100) {
        itemQty = itemQty + 1;
      }
    } else {
      if (itemQty > 1) {
        itemQty = itemQty - 1;
      }
    }
    notifyListeners();
  }
}
