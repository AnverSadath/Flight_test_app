import 'package:flight_test_app/data/models/duration_model.dart';
import 'package:flight_test_app/data/models/flight_item_model.dart';

class FlightJourneyModel {
  final String journeyIdentifier;
  final int travelDirection;
  final DurationModel journeyTime;
  final int totalStops;
  final List<FlightItemModel> flightItems;
  final bool dayChange;

  FlightJourneyModel({
    required this.journeyIdentifier,
    required this.travelDirection,
    required this.journeyTime,
    required this.totalStops,
    required this.flightItems,
    required this.dayChange,
  });

  factory FlightJourneyModel.fromJson(Map<String, dynamic> json) {
    return FlightJourneyModel(
      journeyIdentifier: json['JourneyIdentifier'] ?? '',
      travelDirection: json['TravelDirection'] ?? 0,
      journeyTime: DurationModel.fromJson(json['JourneyTime'] ?? {}),
      totalStops: json['TotalStops'] ?? 0,
      flightItems: (json['FlightItems'] as List<dynamic>? ?? [])
          .map((item) => FlightItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      dayChange: json['DayChange'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'JourneyIdentifier': journeyIdentifier,
      'TravelDirection': travelDirection,
      'JourneyTime': journeyTime.toJson(),
      'TotalStops': totalStops,
      'FlightItems': flightItems.map((item) => item.toJson()).toList(),
      'DayChange': dayChange,
    };
  }
}
