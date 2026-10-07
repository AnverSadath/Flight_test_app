import 'package:flight_test_app/data/models/flight_trip_model.dart';
import 'package:flight_test_app/domain/repositories/flight_repo.dart';

class GetFlightsUseCase {
  final FlightRepository repository;

  GetFlightsUseCase(this.repository);

  Future<List<FlightTripModel>> call() {
    return repository.getFlights();
  }
}
