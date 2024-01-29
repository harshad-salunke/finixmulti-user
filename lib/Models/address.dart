class Address {
  String neighbourhood;
  String county;
  String stateDistrict;
  String state;
  String postcode;
  String country;
  double latitude;
  double longitude;

  Address({
    required this.neighbourhood,
    required this.county,
    required this.stateDistrict,
    required this.state,
    required this.postcode,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      neighbourhood: json['neighbourhood'] ?? '',
      county: json['county'] ?? '',
      stateDistrict: json['stateDistrict'] ?? '',
      state: json['state'] ?? '',
      postcode: json['postcode'] ?? '',
      country: json['country'] ?? '',
      latitude: json['latitude']?.toDouble() ?? 0.0,
      longitude: json['longitude']?.toDouble() ?? 0.0,
    );

  }

  Map<String, dynamic> toJson() {
    return {
      'neighbourhood': neighbourhood,
      'county': county,
      'stateDistrict': stateDistrict,
      'state': state,
      'postcode': postcode,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}