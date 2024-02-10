import 'dart:async';
import 'dart:io';

import 'package:finixmulti_user/FirebaseServices/providers/firbase_auth_handler.dart';
import 'package:finixmulti_user/Models/UserModle.dart';
import 'package:finixmulti_user/Models/booking_modle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../Models/employee.dart';
import '../Models/offers_model.dart';
import '../Models/product.dart';
import 'package:intl/intl.dart';

class FirebaseDatabaseDAO {


   DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    FirebaseAuth firebaseAuth=FirebaseAuth.instance;


   StreamController<UserModel> _userController = StreamController<UserModel>.broadcast();
   Stream<UserModel> get userStream => _userController.stream;

   StreamController<Employee> _employeeController = StreamController<Employee>.broadcast();
   Stream<Employee> get employeeStream => _employeeController.stream;

  StreamController<List<Product>> _productController = StreamController<List<Product>>.broadcast();
   Stream<List<Product>> get productStream => _productController.stream;


  StreamController<List<BookingModel>> _bookingController=StreamController<List<BookingModel>>.broadcast();
  Stream<List<BookingModel>> get bookingStream => _bookingController.stream;

   StreamController<List<Product>> _serviceController = StreamController<List<Product>>.broadcast();
   Stream<List<Product>> get serviceStream => _serviceController.stream;


   StreamController<OffersModel> _offerModelController=StreamController<OffersModel>.broadcast();
   Stream<OffersModel> get offerModelStream=>_offerModelController.stream;

    // getting data from database
   void  fetchUserDetails() {
     String current_user_uid=firebaseAuth.currentUser!.uid;
     databaseReference.child('Users').child(current_user_uid).onValue.listen((event) {
       if (event.snapshot.value != null) {
         Map values = event.snapshot.value as Map;
         UserModel userModel=UserModel.fromJson(values);
         _userController.add(userModel);
       }else{
         _productController.add([]);
       }
     }).onError((error){
       print(error.toString());
     });

   }

   void  fetchEmployeeDetails(String employeeUid) {
     databaseReference.child('Employees').child(employeeUid).get().then((snapshot) {
       if(snapshot.value!=null){
         Map values = snapshot.value as Map;
         Employee employeeModel=Employee.fromJson(values);
         print('lisening');
         _employeeController.add(employeeModel);
       }
     });

   }

   void  fetchServiceManLocatoinDetails(String employeeUid) {
     databaseReference.child('Employees').child(employeeUid).onValue.listen((event) {
       if(event.snapshot.value!=null){
         Map values = event.snapshot.value as Map;
         Employee employeeModel=Employee.fromJson(values);
         print('lisening');
         _employeeController.add(employeeModel);
       }

     });

   }



   void  fetchProducts() {
    databaseReference.child('Products').onValue.listen((event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> values = event.snapshot.value as Map;
        List<Product> products = [];

        values.forEach((key, value) {
          products.add(Product.fromJson(Map<String, dynamic>.from(value)));
        });

        products.sort((a, b) => b.timestamp.compareTo(a.timestamp));

        _productController.add(products);
      }else{
        _productController.add([]);
      }
    }).onError((error){
      print(error.toString());
    });

  }
   void  fetchBookingDetails() {
     String path="Bookings/${firebaseAuth.currentUser?.uid}";
     print(path);
     databaseReference.child(path).onValue.listen((event) {
       if (event.snapshot.value != null) {
         Map<dynamic, dynamic> values = event.snapshot.value as Map;
         List<BookingModel> bookingsList = [];
         values.forEach((key, value) {
           bookingsList.add(BookingModel.fromJson(Map<String, dynamic>.from(value)));
         });
         bookingsList.sort((a, b) {
           // Convert date strings to DateTime objects before comparison
           DateTime dateA = _parseDate(a.date);
           DateTime dateB = _parseDate(b.date);

           return dateB.compareTo(dateA);
         });

         _bookingController.add(bookingsList);
       }else{
         _bookingController.add([]);
       }
     }).onError((error){
       print(error.toString());
     });

   }
   void  fetchServices() {
     databaseReference.child('Services').onValue.listen((event) {
       if (event.snapshot.value != null) {
         Map<dynamic, dynamic> values = event.snapshot.value as Map;
         List<Product> services = [];

         values.forEach((key, value) {
           services.add(Product.fromJson(Map<String, dynamic>.from(value)));
         });

         services.sort((a, b) => b.timestamp.compareTo(a.timestamp));
         services.forEach((element) {
           print(element.toJson());
         });
         _serviceController.add(services);

       }else{
         _serviceController.add([]);
       }
     });

   }
   void featchOffersDetails(){
     String path='Offers/current';
     databaseReference.child(path).get().then((snapshot){
       if(snapshot.value!=null){
         Map data=snapshot.value as Map<dynamic,dynamic>;
         OffersModel offersModel=OffersModel.fromJson(data);
         _offerModelController.add(offersModel);
       }else{
         OffersModel offersModelData = OffersModel(
             serviceOffer: '',
             inviteFriend: '',
             productOffer: '',
             imageEvent: []);
         _offerModelController.add(offersModelData);

       }
     });
   }




   // saving data to database

   Future<UserModel> saveUserDetails(UserModel userModel) async {
    userModel.register_date = _getCurrentDate();
    userModel.uid=FirebaseAuthHandler.firebaseAuth.currentUser!.uid;
    Map<String, dynamic> data = userModel.toJson();

    String path = 'Users/${userModel.uid}';

    await databaseReference.child(path).set(data);
    return userModel;
  }

   Future<UserModel> updateUserDetails(UserModel userModel) async {
     Map<String, dynamic> data = userModel.toJson();

     String path = 'Users/${userModel.uid}';

     await databaseReference.child(path).update(data);
     return userModel;
   }

   Future<BookingModel> updateBookingDetails(BookingModel bookingModel) async {
     String userid=firebaseAuth.currentUser!.uid??'';
     Map<String, dynamic> data = bookingModel.toJson();

     String path = 'Bookings/${userid}/${bookingModel.bookedUid}';

     await databaseReference.child(path).update(data);
     return bookingModel;
   }

   Future<BookingModel> saveBookingDetails(BookingModel bookingModel) async {
    String path='Bookings/${bookingModel.userUid}';
    String? bookingUid= '${DateTime.now().millisecondsSinceEpoch}';
    bookingUid=databaseReference.push().key;
    bookingModel.bookedUid=bookingUid!;
    Map<String,dynamic> bookingdata=bookingModel.toJson();
  await databaseReference.child(path).child(bookingUid).set(bookingdata);
    return bookingModel;
   }


  static String _getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMM y').format(now);
    return formattedDate;
  }

   DateTime _parseDate(String dateString) {
     List<String> parts = dateString.split("-");
     int day = int.parse(parts[0]);
     int month = int.parse(parts[1]);
     int year = int.parse(parts[2]);

     return DateTime(year, month, day);
   }
}
