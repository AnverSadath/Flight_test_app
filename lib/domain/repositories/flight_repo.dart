import 'package:flight_test_app/data/models/flight_trip_model.dart';

abstract class FlightRepository {
  Future<List<FlightTripModel>> getFlights();
}
