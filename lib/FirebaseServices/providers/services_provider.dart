import 'package:flutter/cupertino.dart';

import '../../Models/product.dart';
import '../firebase_database_dao.dart';




class ServiceProvider extends ChangeNotifier {
  List<Product> product_list=[];
  FirebaseDatabaseDAO _firebaseDatabaseDAO = FirebaseDatabaseDAO();
  bool isProductDataLoaded=true;

  void fetchProducts() {
    _firebaseDatabaseDAO.productStream.listen((products) {
      product_list = products;
      isProductDataLoaded=false;
      notifyListeners();
    });
     _firebaseDatabaseDAO.fetchProducts();
  }

}