import 'package:flight_test_app/data/datasource/local/flight_local_datasource.dart';
import 'package:flight_test_app/data/datasource/remote/flight_remote_datasource.dart';
import 'package:flight_test_app/data/models/flight_trip_model.dart';
import 'package:flight_test_app/domain/repositories/flight_repo.dart';

class FlightRepositoryImpl implements FlightRepository {
  final FlightRemoteDataSource remoteDataSource;
  final FlightLocalDataSource localDataSource;

  FlightRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<FlightTripModel>> getFlights() async {
    final localFlights = await localDataSource.getFlights();

    if (localFlights.isNotEmpty) {
      return localFlights;
    }

    final response = await remoteDataSource.getFlights();

    final flights = response.data.flightTrips;

    await localDataSource.saveFlights(flights);

    return flights;
  }
}
