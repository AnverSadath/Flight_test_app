import 'dart:convert';

import 'package:flight_test_app/core/database/database_helper.dart';
import 'package:flight_test_app/data/models/flight_trip_model.dart';

class FlightLocalDataSource {
  final DatabaseHelper databaseHelper;

  FlightLocalDataSource(this.databaseHelper);

  Future<void> saveFlights(List<FlightTripModel> flights) async {
    final database = await databaseHelper.database;

    final batch = database.batch();

    for (final flight in flights) {
      batch.insert(DatabaseHelper.flightTable, {
        'flightTripKey': flight.flightTripKey,
        'flightData': jsonEncode(flight.toJson()),
      });
    }

    await batch.commit(noResult: true);
  }

  Future<List<FlightTripModel>> getFlights() async {
    final database = await databaseHelper.database;

    final result = await database.query(DatabaseHelper.flightTable);

    return result.map((row) {
      final flightData = jsonDecode(row['flightData'] as String);

      return FlightTripModel.fromJson(flightData);
    }).toList();
  }
}
