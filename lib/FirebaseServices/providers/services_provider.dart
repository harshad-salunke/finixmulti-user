import 'package:finixmulti_user/Models/address.dart';
import 'package:finixmulti_user/Models/employee.dart';
import 'package:flutter/cupertino.dart';

import '../../Models/booking_modle.dart';
import '../../Models/offers_model.dart';
import '../../Models/product.dart';
import '../../Models/UserModle.dart';

import '../firebase_database_dao.dart';

class ServiceProvider extends ChangeNotifier {
  FirebaseDatabaseDAO firebaseDatabaseDAO = FirebaseDatabaseDAO();

  late UserModel userData = UserModel(
      phone_number: '',
      isblock:false,
      name: '',
      msgToken: '',
      uid: '',
      register_date: '',
      gender: '',
      email: '',
      password: '');

  Employee employeeData = Employee(
      name: 'Help Center',
      uid: '',
      email: '',
      password: '',
      profile: 'assets/images/operator.png',
      phone_number: '8007453007',
      latitude: 0,
      longitude: 0);

  OffersModel offersModelData = OffersModel(
      serviceOffer: '',
      inviteFriend: '',
      productOffer: '',
      imageEvent: []);

  List<Product> product_list = [];
  List<BookingModel> booking_list = [];
  List<Product> service_list = [];

  List<Product> filterProductList = [];
  List<Product> filterServiceList = [];

  bool isProductDataLoading = true;
  bool isServiceDataLoading = true;
  bool isAddressLoading = true;
  bool isBookingLoading = true;
  bool isEmplooyeeLoading=true;
  bool isOfferLoading = true;

  late BookingModel bookingData;
  late String myAddressText;

  late Product selectedProduct;

  //get data from database
  void featchOffers(){
    firebaseDatabaseDAO.offerModelStream.listen((offer) {
      offersModelData=offer;
      isOfferLoading=false;
      print("** offers ******************* ${offersModelData.toJson()}");
      notifyListeners();

    });
    firebaseDatabaseDAO.featchOffersDetails();
  }

  void fetchUserDetails() {
    firebaseDatabaseDAO.userStream.listen((user) {
      userData = user;
      notifyListeners();
    });

    firebaseDatabaseDAO.fetchUserDetails();
  }

  void fetchEmployeeDetails() {
    String employeeUid=bookingData.assignEmployeeUid;
    if(employeeUid==''){
      isEmplooyeeLoading=false;

      notifyListeners();
    }else{
      firebaseDatabaseDAO.employeeStream.listen((employee) {
        employeeData = employee;
        isEmplooyeeLoading=false;
        notifyListeners();

      });
      firebaseDatabaseDAO.fetchEmployeeDetails(employeeUid);
    }


  }


  void fetchProducts() {
    firebaseDatabaseDAO.productStream.listen((products) {
      product_list = products;
      filterProductList = products;
      isProductDataLoading = false;
      notifyListeners();
    });
    firebaseDatabaseDAO.fetchProducts();
  }

  void fetchServices() {
    firebaseDatabaseDAO.serviceStream.listen((service) {
      service_list = service;
      isServiceDataLoading = false;
      notifyListeners();
    });

    firebaseDatabaseDAO.fetchServices();
  }

  void fetchBookings() {
    firebaseDatabaseDAO.bookingStream.listen((booking) {
      booking_list = booking;
      isBookingLoading = false;
      notifyListeners();
    });
    firebaseDatabaseDAO.fetchBookingDetails();
  }

  //save data to database
  Future<void> saveUserDetails(UserModel userModel) async {
    userData = await firebaseDatabaseDAO.saveUserDetails(userModel);
    notifyListeners();
  }

  Future<void> updateUserDetails(UserModel userModel) async {
    userData = await firebaseDatabaseDAO.updateUserDetails(userModel);
    notifyListeners();
  }

  Future<void> updateBookingDetails(BookingModel bookingModel) async {
    bookingData = await firebaseDatabaseDAO.updateBookingDetails(bookingModel);
    notifyListeners();
  }

  //internal data state setting
  void setBookingData(BookingModel bookingModel) {
    bookingData = bookingModel;
    notifyListeners();
  }

  void setAddressData(Address address, String addressStr) {
    bookingData.address = address;
    myAddressText = addressStr;
    isAddressLoading = false;
    notifyListeners();
  }

  void setEmptyAddress() {
    Address emptyAddress = Address(
        neighbourhood: "",
        county: "",
        stateDistrict: "",
        state: "",
        postcode: "",
        country: "",
        latitude: 0.0,
        longitude: 0.0);
    isAddressLoading = true;
    bookingData.address = emptyAddress;
    myAddressText = '';
    notifyListeners();
  }
  void setEmptyEmployee(){
    employeeData = Employee(
        name: 'Help Center',
        uid: '',
        email: '',
        password: '',
        profile: 'assets/images/operator.png',
        phone_number: '8007453007',
        latitude: 0,
        longitude: 0);
    isEmplooyeeLoading=true;
    notifyListeners();
  }

  void setSelectedProduct(Product product) {
    selectedProduct = product;
    notifyListeners();
  }
}
