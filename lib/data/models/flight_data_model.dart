import 'package:flight_test_app/data/models/flight_trip_model.dart';

class FlightDataModel {
  final int resultCount;
  final String currency;
  final List<FlightTripModel> flightTrips;

  FlightDataModel({
    required this.resultCount,
    required this.currency,
    required this.flightTrips,
  });

  factory FlightDataModel.fromJson(Map<String, dynamic> json) {
    return FlightDataModel(
      resultCount: json['ResultCount'] ?? 0,
      currency: json['Currency'] ?? '',
      flightTrips: (json['FlightTrips'] as List<dynamic>? ?? [])
          .map((trip) => FlightTripModel.fromJson(trip as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ResultCount': resultCount,
      'Currency': currency,
      'FlightTrips': flightTrips.map((trip) => trip.toJson()).toList(),
    };
  }
}
