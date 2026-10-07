import 'package:flight_test_app/data/models/flight_trip_model.dart';
import 'package:flight_test_app/presentation/views/flight_list_screen/flight_details_row.dart';
import 'package:flutter/material.dart';

class FlightCard extends StatelessWidget {
  final FlightTripModel flight;

  const FlightCard({super.key, required this.flight});

  String _formatTime(String dateTime) {
    final parsed = DateTime.tryParse(dateTime);

    if (parsed == null) {
      return dateTime;
    }

    return '${parsed.hour.toString().padLeft(2, '0')}:'
        '${parsed.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final flightItem = flight.flightJourneys.first.flightItems.first;
    final airlineCode = flightItem.flightInfo.code;

    final airlineLogoUrl =
        'https://souqsafaraiweb.caxita.ca/AirlineIcons/$airlineCode.svg';

    final returnFlightItem = flight.flightJourneys[1].flightItems.first;

    final returnAirlineCode = returnFlightItem.flightInfo.code;

    final returnAirlineLogoUrl =
        'https://souqsafaraiweb.caxita.ca/AirlineIcons/$returnAirlineCode.svg';

    return Container(
      width: 350,
      height: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipPath(
        clipper: TicketClipper(),
        child: Container(
          width: 350,
          height: 250,
          color: Colors.white,
          child: Stack(
            children: [
              // FLIGHT CONTENT
              Padding(
                padding: const EdgeInsets.only(left: 13, right: 18, top: 20),
                child: Column(
                  children: [
                    FlightDetailRow(
                      airlineIcon: airlineLogoUrl,
                      airlineName: flightItem.flightInfo.nameEn,
                      flightNumber: flightItem.flightInfo.number,
                      departureTime: _formatTime(flightItem.departure.dateTime),
                      departureCode: flightItem.departure.airportCode,
                      stopCode: flightItem.arrival.airportCode,
                      duration:
                          "${flight.flightJourneys[0].journeyTime.hours}H:"
                          "${flight.flightJourneys[0].journeyTime.minutes}M",
                      arrivalTime: _formatTime(flightItem.arrival.dateTime),
                      arrivalCode: flightItem.arrival.airportCode,
                    ),

                    const SizedBox(height: 19),

                    FlightDetailRow(
                      airlineIcon: returnAirlineLogoUrl,
                      airlineName: returnFlightItem.flightInfo.nameEn,
                      flightNumber: returnFlightItem.flightInfo.number,
                      departureTime: _formatTime(
                        returnFlightItem.departure.dateTime,
                      ),
                      departureCode: returnFlightItem.departure.airportCode,
                      stopCode: returnFlightItem.arrival.airportCode,
                      duration:
                          "${flight.flightJourneys[1].journeyTime.hours}H:"
                          "${flight.flightJourneys[1].journeyTime.minutes}M",
                      arrivalTime: _formatTime(
                        returnFlightItem.arrival.dateTime,
                      ),
                      arrivalCode: returnFlightItem.arrival.airportCode,
                    ),
                  ],
                ),
              ),

              // DASHED LINE
              const Positioned(
                left: 0,
                right: 0,
                bottom: 44,
                child: DashedDivider(),
              ),

              // PRICE
              Positioned(
                left: 25,
                right: 25,
                bottom: 0,
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Non Refundable',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFE74040),
                      ),
                    ),
                    Text(
                      '${flight.fareDetails.currency} ${flight.fareDetails.total}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TICKET CLIPPER
class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final ticketPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(12),
        ),
      );

    final leftCutout = Path()
      ..addOval(
        Rect.fromCircle(center: Offset(0, size.height - 45), radius: 12),
      );

    final rightCutout = Path()
      ..addOval(
        Rect.fromCircle(
          center: Offset(size.width, size.height - 45),
          radius: 12,
        ),
      );

    final leftResult = Path.combine(
      PathOperation.difference,
      ticketPath,
      leftCutout,
    );

    return Path.combine(PathOperation.difference, leftResult, rightCutout);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

// DASHED DIVIDER
class DashedDivider extends StatelessWidget {
  const DashedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 1),
      painter: DashedLinePainter(),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    const dashWidth = 5.0;
    const dashSpace = 4.0;

    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);

      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
