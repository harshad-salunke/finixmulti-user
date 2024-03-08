class Product {
  String uid;
  String name;
  String brandName;
  String category;
  String warranty;
  String des;
  int price;
  int disPrice;
  List<String> imgUri;

  int rating;
  int timestamp;

  Product({
    required this.uid,
    required this.name,
    required this.brandName,
    required this.category,
    required this.warranty,
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
      'category':category,
      'warranty':warranty,
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
      category:json['category'],
      warranty:json['warranty']??'',
      des: json['des'],
      price: json['price'],
      disPrice: json['disPrice'],
      imgUri: List<String>.from(json['imgUri']),
      rating: json['rating'],
      timestamp: json['timestamp'], // Include timestamp in the factory method
    );
  }
}
