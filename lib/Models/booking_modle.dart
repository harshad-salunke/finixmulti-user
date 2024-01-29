import 'package:finixmulti_user/Models/employee.dart';

import 'address.dart';

class BookingModel {

  // user details
  String userName;
  String userUid;

  // service details
  bool isProduct;
  bool firstTimeService;
  String serviceName;
  String serviceUid;

  //booking details
  String bookedUid;
  String bookingStatus;
  String servingStatus;
  String orderDate;
  String date;
  String timeSlot;
  String time;
  Address address;
  String instruction;
  String paymentOption;
  String paymentMethod;
  int paidMoney;
  int prepaidMoney;

  // assign employe
  String assignEmployeeUid;

  BookingModel({
   required this.userName,
    required this.userUid,
    required this.isProduct,
    required this.firstTimeService,
    required this.serviceName,
    required this.serviceUid,
    required this.bookedUid,
    required this.bookingStatus,
    required this.servingStatus,
    required this.orderDate,
    required this.date,
    required this.timeSlot,
    required this.time,
    required this.address,
    required this.instruction,
    required this.paymentOption,
    required this.paymentMethod,
    required this.paidMoney,
    required this.prepaidMoney,
    required this.assignEmployeeUid
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
        userName: json['userName'],
        userUid: json['userUid'],
        isProduct: json['isProduct'],
        firstTimeService: json['firstTimeService'],
        serviceName:json['serviceName'] ,
        serviceUid:json['serviceUid'] ,
        bookedUid:json['bookedUid'] ,
        bookingStatus:json['bookingStatus'],
        servingStatus: json['servingStatus'],
        orderDate: json['orderDate'],
        date:json['date'] ,
        timeSlot:json['timeSlot'] ,
        time:json['time'] ,
        address: Address.fromJson(Map<String, dynamic>.from(json['address'])),
        instruction:json['instruction'],
        paymentOption:json['paymentOption'] ,
        paymentMethod:json['paymentMethod'] ,
        paidMoney: json['paidMoney'],
      prepaidMoney: json['prepaidMoney'],
      assignEmployeeUid: json['assignEmployeeUid'],
    );


  }

  Map<String, dynamic> toJson() {
    return {
      'userName':userName,
      'userUid':userUid,
      'isProduct':isProduct,
      'firstTimeService':firstTimeService,
      'serviceName':serviceName,
      'serviceUid':serviceUid,
      'bookedUid':bookedUid,
      'bookingStatus':bookingStatus,
      'servingStatus':servingStatus,
      'orderDate':orderDate,
      'date':date,
      'timeSlot':timeSlot,
      'time':time,
      'address':address.toJson(),
      'instruction':instruction,
      'paymentOption':paymentOption,
      'paymentMethod':paymentMethod,
      'paidMoney':paidMoney,
      'prepaidMoney':prepaidMoney,
      'assignEmployeeUid':assignEmployeeUid,
    };
  }
}