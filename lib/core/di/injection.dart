import 'package:flight_test_app/data/datasource/local/flight_local_datasource.dart';
import 'package:flight_test_app/data/repositories/flight_repo_impl.dart';
import 'package:flight_test_app/presentation/providers/flight_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:flight_test_app/core/database/database_helper.dart';
import 'package:flight_test_app/data/datasource/remote/flight_remote_datasource.dart';
import 'package:flight_test_app/domain/repositories/flight_repo.dart';
import 'package:flight_test_app/domain/usecases/get_flights_usecase.dart';

final sl = GetIt.instance;

void setupDependencies() {
  // Database
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // HTTP Client
  sl.registerLazySingleton<http.Client>(() => http.Client());

  // Data Sources
  sl.registerLazySingleton<FlightLocalDataSource>(
    () => FlightLocalDataSource(sl<DatabaseHelper>()),
  );

  sl.registerLazySingleton<FlightRemoteDataSource>(
    () => FlightRemoteDataSource(sl<http.Client>()),
  );

  // Repository
  sl.registerLazySingleton<FlightRepository>(
    () => FlightRepositoryImpl(
      sl<FlightRemoteDataSource>(),
      sl<FlightLocalDataSource>(),
    ),
  );

  // Use Case
  sl.registerLazySingleton<GetFlightsUseCase>(
    () => GetFlightsUseCase(sl<FlightRepository>()),
  );

  // Provider
  sl.registerFactory<FlightProvider>(
    () => FlightProvider(sl<GetFlightsUseCase>()),
  );
}
