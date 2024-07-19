import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final List<AbayatList> abayatList = [
    AbayatList(
        id: 1,
        name: "Eid Abaya 2023",
        description: "Regular Collection",
        price: 8.9,
        imgPath: "assets/background.png",
        qty: 1),
    AbayatList(
        id: 2,
        name: "Ramadan Abaya 2023",
        description: "Regular Collection",
        price: 12.9,
        imgPath: "assets/background.png",
        qty: 1),
    AbayatList(
        id: 3,
        name: "Summer Abaya 2023",
        description: "Regular Collection",
        price: 11.9,
        imgPath: "assets/background.png",
        qty: 1),
    AbayatList(
        id: 4,
        name: "Eid Abaya 2021",
        description: "Regular Collection",
        price: 7.9,
        imgPath: "assets/background.png",
        qty: 1),
    AbayatList(
        id: 5,
        name: "Eid Abaya 2023",
        description: "Regular Collection",
        price: 13.9,
        imgPath: "assets/background.png",
        qty: 1),
  ];

  Future<void> addAbayatListItem(
      String key, AbayatList newAbayat, BuildContext context) async {
    List<AbayatList> abayatList = await getAbayatList(key);
    abayatList.add(newAbayat);
    await saveAbayatList(key, abayatList);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Item Added')),
    );
  }

  Future<List<AbayatList>> getAbayatList(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? abayatJsonList = sharedPreferences.getStringList(key);
    if (abayatJsonList != null) {
      return abayatJsonList
          .map((abayatJson) => AbayatList.fromJson(jsonDecode(abayatJson)))
          .toList();
    }
    return [];
  }

  Future<void> saveAbayatList(String key, List<AbayatList> abayatList) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> abayatJsonList =
        abayatList.map((abayat) => jsonEncode(abayat.toJson())).toList();
    await sharedPreferences.setStringList(key, abayatJsonList);
  }

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

class AbayatList {
  int id;
  String name;
  String description;
  double price;
  String imgPath;
  int qty;
  AbayatList({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imgPath,
    required this.qty,
  });

  factory AbayatList.fromJson(Map<String, dynamic> json) {
    return AbayatList(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imgPath: json['imgPath'],
      qty: json['qty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imgPath': imgPath,
      'qty': qty,
    };
  }
}
