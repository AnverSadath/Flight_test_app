import 'package:flight_test_app/domain/usecases/get_flights_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flight_test_app/data/models/flight_trip_model.dart';

class FlightProvider extends ChangeNotifier {
  final GetFlightsUseCase getFlightsUseCase;

  FlightProvider(this.getFlightsUseCase);

  List<FlightTripModel> _flights = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<FlightTripModel> get flights => _flights;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  //   Future<void> getFlights() async {
  //     _isLoading = true;
  //     _errorMessage = null;
  //     notifyListeners();

  //     try {
  //       _flights = await getFlightsUseCase();
  //     } catch (e) {
  //       _errorMessage = e.toString();
  //     } finally {
  //       _isLoading = false;
  //       notifyListeners();
  //     }
  //   }
  // }

  Future<void> getFlights() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _flights = await getFlightsUseCase();

      print('Flight count: ${_flights.length}');

      for (final flight in _flights) {
        print('Flight Trip: ${flight.flightTripKey}');
        print(
          'Airline: ${flight.flightJourneys.first.flightItems.first.flightInfo.nameEn}',
        );
        print(
          'Airline Code: ${flight.flightJourneys.first.flightItems.first.flightInfo.code}',
        );
      }
    } catch (e) {
      print('Flight Error: $e');
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
