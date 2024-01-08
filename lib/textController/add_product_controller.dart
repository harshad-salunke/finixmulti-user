import 'package:flutter/cupertino.dart';

import '../Models/product.dart';

class AddProductController {
  TextEditingController name_controller = TextEditingController();
  TextEditingController des_controller = TextEditingController();
  TextEditingController price_controller = TextEditingController();
  TextEditingController disPrice_controller = TextEditingController();
  late String name;
  late String des;
  late int price;
  late int disPrice;

  String validateData() {
    name = name_controller.text;
    des = des_controller.text;
    price = int.tryParse(price_controller.text) ?? 0;
    disPrice = int.tryParse(disPrice_controller.text) ?? 0;

    if (name.isEmpty || name == '') {
      return "Please enter product name";
    }

    if (price == 0) {
      return "Please enter price";
    }
    if (disPrice == 0) {
      return "Please enter discount price";
    }
    if (des.isEmpty || des == '') {
      return "Please enter description ";
    }
    return 'true';
  }

  Product getData() {
    return Product(
        uid: "",
        name: name,
        des: des,
        price: price,
        disPrice: disPrice,
        imgUri: [],
        rating: 4,
    timestamp: 0);
  }
}
