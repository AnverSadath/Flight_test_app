import 'package:flight_test_app/domain/usecases/get_flights_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flight_test_app/data/models/flight_trip_model.dart';

class FlightProvider extends ChangeNotifier {
  final GetFlightsUseCase getFlightsUseCase;

  FlightProvider(this.getFlightsUseCase);

  List<FlightTripModel> _flights = [];
  List<FlightTripModel> _allFlights = [];

  bool _isLoading = false;
  String? _errorMessage;

  List<FlightTripModel> get flights => _flights;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  //GET FLIGHTS
  Future<void> getFlights() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _allFlights = await getFlightsUseCase();
      _flights = List.from(_allFlights);
    } catch (e) {
      print('Flight Error: $e');
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //FILTER AIRLINE LIST
  List<String> get airlines {
    return _allFlights
        .map(
          (flight) =>
              flight.flightJourneys.first.flightItems.first.flightInfo.nameEn,
        )
        .toSet()
        .toList();
  }

  //SORT FLIGHTS
  void sortFlights(String type, bool ascending) {
    _flights.sort((a, b) {
      switch (type) {
        case 'Airline':
          final airlineA =
              a.flightJourneys.first.flightItems.first.flightInfo.nameEn;

          final airlineB =
              b.flightJourneys.first.flightItems.first.flightInfo.nameEn;

          return ascending
              ? airlineA.compareTo(airlineB)
              : airlineB.compareTo(airlineA);

        case 'Duration':
          final durationA = _getDurationInMinutes(a);
          final durationB = _getDurationInMinutes(b);

          return ascending
              ? durationA.compareTo(durationB)
              : durationB.compareTo(durationA);

        case 'Price':
          final priceA = a.fareDetails.total;
          final priceB = b.fareDetails.total;

          return ascending
              ? priceA.compareTo(priceB)
              : priceB.compareTo(priceA);

        default:
          return 0;
      }
    });

    notifyListeners();
  }

  void resetSort() {
    _flights = List.from(_allFlights);
    notifyListeners();
  }

  //GET DURATION
  int _getDurationInMinutes(FlightTripModel flight) {
    final duration = flight.tripDuration;

    return (duration.days * 24 * 60) + (duration.hours * 60) + duration.minutes;
  }

  //FILTER AIRLINES
  void filterByAirlines(Set<String> selectedAirlines) {
    if (selectedAirlines.isEmpty) {
      _flights = List.from(_allFlights);
    } else {
      _flights = _allFlights.where((flight) {
        final airline =
            flight.flightJourneys.first.flightItems.first.flightInfo.nameEn;

        return selectedAirlines.contains(airline);
      }).toList();
    }

    notifyListeners();
  }
}
