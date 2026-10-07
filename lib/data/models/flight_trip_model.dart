import 'package:flight_test_app/data/models/duration_model.dart';
import 'package:flight_test_app/data/models/fare_details_model.dart';
import 'package:flight_test_app/data/models/flight_journey_model.dart';

class FlightTripModel {
  final String flightTripKey;
  final FareDetailsModel fareDetails;
  final List<FlightJourneyModel> flightJourneys;
  final DurationModel tripDuration;
  final int tripDirection;

  FlightTripModel({
    required this.flightTripKey,
    required this.fareDetails,
    required this.flightJourneys,
    required this.tripDuration,
    required this.tripDirection,
  });

  factory FlightTripModel.fromJson(Map<String, dynamic> json) {
    return FlightTripModel(
      flightTripKey: json['FlightTripKey'] ?? '',
      fareDetails: FareDetailsModel.fromJson(json['FareDetails'] ?? {}),
      flightJourneys: (json['FlightJourneys'] as List<dynamic>? ?? [])
          .map(
            (journey) =>
                FlightJourneyModel.fromJson(journey as Map<String, dynamic>),
          )
          .toList(),
      tripDuration: DurationModel.fromJson(json['TripDuration'] ?? {}),
      tripDirection: json['TripDirection'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'FlightTripKey': flightTripKey,
      'FareDetails': fareDetails.toJson(),
      'FlightJourneys': flightJourneys
          .map((journey) => journey.toJson())
          .toList(),
      'TripDuration': tripDuration.toJson(),
      'TripDirection': tripDirection,
    };
  }
}
