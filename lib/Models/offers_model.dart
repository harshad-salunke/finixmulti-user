class OffersModel{
  String serviceOffer;
  String inviteFriend;
  String productOffer;
  List<String> imageEvent;

  OffersModel({required this.serviceOffer,required this.inviteFriend,required this.productOffer,required this.imageEvent});

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data={
      'serviceOffer':serviceOffer,
      'inviteFriend':inviteFriend,
      'productOffer':productOffer,
      'imageEvent': imageEvent.map((img) => img).toList(),
    };
    return data;
  }
  factory OffersModel.fromJson(Map<dynamic,dynamic> json){
    return OffersModel(
        serviceOffer: json['serviceOffer'],
        inviteFriend: json['inviteFriend'],
        productOffer: json['productOffer'],
      imageEvent: json['imageEvent'] != null ? List<String>.from(json['imageEvent']) : [], // Provide empty list if null
    );
  }

}