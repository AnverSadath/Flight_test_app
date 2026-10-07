import 'dart:convert';

import 'package:flight_test_app/data/models/flight_response_model.dart';
import 'package:http/http.dart' as http;

class FlightRemoteDataSource {
  final http.Client client;
  FlightRemoteDataSource(this.client);

  static const String apiUrl =
      'http://103.214.233.90/mechine_test/results.json';

  Future<FlightResponseModel> getFlights() async {
    try {
      final response = await client.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        print('API Response:');
        print(response.body);

        final jsonData = jsonDecode(response.body);

        final flightResponse = FlightResponseModel.fromJson(jsonData);

        print('API ResultCount: ${flightResponse.data.resultCount}');
        print('API FlightTrips: ${flightResponse.data.flightTrips.length}');

        return flightResponse;
      } else {
        throw Exception('Failed to load flight data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch flight data: $e');
    }
  }
}
