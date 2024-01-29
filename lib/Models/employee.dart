class Employee{
  String name;
  String uid;
  String email;
  String password;
  String profile;
  String phone_number;
  double latitude;
  double longitude;


  Employee({
    required this.email,
    required this.password,
    required this.profile,
    required this.name,
    required this.uid,
    required this.phone_number,required this.latitude,required this.longitude});

factory Employee.fromJson(Map<dynamic,dynamic> json){
  return Employee(name: json['name'],
      email: json['email'],
      password: json['password'],
      profile: json['profile'],
      uid: json['uid'],
    phone_number: json['phone_number'],
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
  );
}



  Map<String, dynamic> toJson() {
    return {
      'name': name??'',
      'uid':uid??'',
      'email':email??'',
      'profile':profile??'',
      'password':password??'',
      'phone_number': phone_number??'',
      'latitude': latitude?? 0.0,
      'longitude': longitude?? 0.0,
    };
  }

}