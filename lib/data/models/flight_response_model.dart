import 'package:flight_test_app/data/models/flight_data_model.dart';

class FlightResponseModel {
  final String version;
  final String code;
  final List<String> message;
  final FlightDataModel data;

  FlightResponseModel({
    required this.version,
    required this.code,
    required this.message,
    required this.data,
  });

  factory FlightResponseModel.fromJson(Map<String, dynamic> json) {
    return FlightResponseModel(
      version: json['Version'] ?? '',
      code: json['Code'] ?? '',
      message: List<String>.from(json['Message'] ?? []),
      data: FlightDataModel.fromJson(json['Data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Version': version,
      'Code': code,
      'Message': message,
      'Data': data.toJson(),
    };
  }
}
