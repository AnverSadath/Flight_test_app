class AirportModel {
  final String airportCode;
  final String cityNameEn;
  final String cityNameAr;
  final String dateTime;
  final String terminal;

  AirportModel({
    required this.airportCode,
    required this.cityNameEn,
    required this.cityNameAr,
    required this.dateTime,
    required this.terminal,
  });

  factory AirportModel.fromJson(Map<String, dynamic> json) {
    final cityName = json['CityName'] ?? {};

    return AirportModel(
      airportCode: json['AirportCode'] ?? '',
      cityNameEn: cityName['en'] ?? '',
      cityNameAr: cityName['ar'] ?? '',
      dateTime: json['DateTime'] ?? '',
      terminal: json['Terminal'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'AirportCode': airportCode,
      'CityName': {'en': cityNameEn, 'ar': cityNameAr},
      'DateTime': dateTime,
      'Terminal': terminal,
    };
  }
}
