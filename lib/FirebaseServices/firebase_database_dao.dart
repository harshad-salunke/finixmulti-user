import 'dart:async';
import 'dart:io';

import 'package:finixmulti_user/FirebaseServices/providers/firbase_auth_handler.dart';
import 'package:finixmulti_user/Models/UserModle.dart';
import 'package:firebase_database/firebase_database.dart';

import '../Models/product.dart';
import 'package:intl/intl.dart';

class FirebaseDatabaseDAO {


  static DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  StreamController<List<Product>> _productController = StreamController<List<Product>>.broadcast();
  Stream<List<Product>> get productStream => _productController.stream;

  void  fetchProducts() {
   print("feaching data");
    databaseReference.child('Products').onValue.listen((event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> values = event.snapshot.value as Map;
        List<Product> products = [];

        values.forEach((key, value) {
          products.add(Product.fromJson(Map<String, dynamic>.from(value)));
        });

        products.sort((a, b) => b.timestamp.compareTo(a.timestamp));
        products.forEach((element) {
          print(element.toJson());
        });
        _productController.add(products);
      }else{
        _productController.add([]);
      }
    }).onError((error){
      print(error.toString());
    });

  }

  static Future<UserModel> saveUserDetails(UserModel userModel) async {
    userModel.register_date = _getCurrentDate();
    userModel.uid=FirebaseAuthHandler.firebaseAuth.currentUser!.uid;
    Map<String, dynamic> data = userModel.toJson();

    String path = 'Users/${userModel.uid}';

    await databaseReference.child(path).set(data);
    return userModel;
  }

  static String _getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMM y').format(now);

    return formattedDate;
  }

}
