class Product {
  String uid;
  String name;
  String brandName;
  String des;
  int price;
  int disPrice;
  List<String> imgUri;
  int rating;
  int timestamp; // Add timestamp property

  Product({
    required this.uid,
    required this.name,
    required this.brandName,
    required this.des,
    required this.price,
    required this.disPrice,
    required this.imgUri,
    required this.rating,
    required this.timestamp, // Include timestamp in the constructor
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'uid': uid,
      'name': name,
      'brandName':brandName,
      'des': des,
      'price': price,
      'disPrice': disPrice,
      'imgUri': imgUri.map((img) => img).toList(),
      'rating': rating,
      'timestamp': timestamp, // Include timestamp in the JSON representation
    };
    return data;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      uid: json['uid'],
      name: json['name'],
      brandName:json['brandName'],
      des: json['des'],
      price: json['price'],
      disPrice: json['disPrice'],
      imgUri: List<String>.from(json['imgUri']),
      rating: json['rating'],
      timestamp: json['timestamp'], // Include timestamp in the factory method
    );
  }
}
