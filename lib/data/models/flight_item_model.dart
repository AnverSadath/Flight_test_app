import 'package:flight_test_app/data/models/airport_model.dart';
import 'package:flight_test_app/data/models/duration_model.dart';
import 'package:flight_test_app/data/models/flight_info_model.dart';

class FlightItemModel {
  final String segmentIdentifier;
  final AirportModel departure;
  final AirportModel arrival;
  final FlightInfoModel flightInfo;
  final DurationModel durationPerLeg;
  final DurationModel transitTime;
  final int numberOfStops;

  FlightItemModel({
    required this.segmentIdentifier,
    required this.departure,
    required this.arrival,
    required this.flightInfo,
    required this.durationPerLeg,
    required this.transitTime,
    required this.numberOfStops,
  });

  factory FlightItemModel.fromJson(Map<String, dynamic> json) {
    return FlightItemModel(
      segmentIdentifier: json['SegmentIdentifier'] ?? '',
      departure: AirportModel.fromJson(json['Departure'] ?? {}),
      arrival: AirportModel.fromJson(json['Arrival'] ?? {}),
      flightInfo: FlightInfoModel.fromJson(json['FlightInfo'] ?? {}),
      durationPerLeg: DurationModel.fromJson(json['DurationPerLeg'] ?? {}),
      transitTime: DurationModel.fromJson(json['TransitTime'] ?? {}),
      numberOfStops: json['NumberOfStops'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'SegmentIdentifier': segmentIdentifier,
      'Departure': departure.toJson(),
      'Arrival': arrival.toJson(),
      'FlightInfo': flightInfo.toJson(),
      'DurationPerLeg': durationPerLeg.toJson(),
      'TransitTime': transitTime.toJson(),
      'NumberOfStops': numberOfStops,
    };
  }
}
