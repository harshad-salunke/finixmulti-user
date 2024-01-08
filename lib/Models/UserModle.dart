class UserModel {
  String phone_number;
  String email ;
  String password ;
  String name;
  String uid;
  String register_date;
  String gender;

  UserModel({
    required this.phone_number,
    required this.name,
    required this.uid,
    required this.register_date,
    required this.gender,
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {

    return UserModel(
      phone_number: json['phone_number'],
      name: json['name'],
      uid: json['uid'],
      register_date: json['register_date'],
      gender: json['gender'],
      email: json['email']  ,
      password: json['password']  ,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'phone_number': phone_number,
      'name': name,
      'uid': uid,
      'register_date': register_date,
      'gender': gender,
      'email': email,
      'password': password,
    };

    return data;
  }
}
