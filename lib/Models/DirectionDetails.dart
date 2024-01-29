class DirectionDetails {
  double time;
  String timeText;
  double distance;
  String distanceText;
  List<List<double>> coordinates;

  DirectionDetails({
    required this.time,
    required this.timeText,
    required this.distance,
    required this.distanceText,
    required this.coordinates,
  });

  factory DirectionDetails.fromJson(Map<String, dynamic> json) {
    final properties = json['properties'];
    final legs = properties['legs'][0];
    return DirectionDetails(
      time: legs['time'].toDouble(),
      timeText: getTimeText(legs['time'].toDouble()),
      distance: legs['distance'].toDouble(),
      distanceText: getDistanceText(legs['distance'].toDouble()),
      coordinates: List<List<double>>.from(
        json['geometry']['coordinates'][0].map((coord) => List<double>.from(coord)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'timeText': timeText,
      'distance': distance,
      'distanceText': distanceText,
      'coordinates': coordinates,
    };
  }

  static String getTimeText(double time) {

    return '$time min'; // Placeholder implementation
  }

  static String getDistanceText(double distance) {

    return '$distance meters';
  }
}
