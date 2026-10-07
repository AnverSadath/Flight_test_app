import 'package:flutter/material.dart';

class FlightDetailRow extends StatelessWidget {
  final String airlineIcon;
  final String departureTime;
  final String departureCode;
  final String stopCode;
  final String duration;
  final String arrivalTime;
  final String arrivalCode;

  const FlightDetailRow({
    super.key,
    required this.airlineIcon,
    required this.departureTime,
    required this.departureCode,
    required this.stopCode,
    required this.duration,
    required this.arrivalTime,
    required this.arrivalCode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // AIRLINE ICON
        Image.asset(airlineIcon),

        // DEPARTURE
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Departure",
              style: TextStyle(
                color: Color(0xFF4747478F),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              departureTime,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              departureCode,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF474747),
              ),
            ),
          ],
        ),

        // ROUTE
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.translate(
                offset: const Offset(0, 6),
                child: Text(
                  stopCode,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF474747),
                  ),
                ),
              ),

              SizedBox(
                width: 105,
                height: 24,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset("assets/images/line_2.png", width: 105),

                    Positioned(
                      left: -9,
                      child: Image.asset(
                        "assets/images/round_icon.png",
                        width: 25,
                        height: 24,
                      ),
                    ),

                    Positioned(
                      left: 40,
                      child: Container(
                        width: 25,
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFF969696)),
                        ),
                      ),
                    ),

                    Positioned(
                      right: -5,
                      child: Image.asset(
                        "assets/images/filled_aeroplane_icon.png",
                        width: 22,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),

              Transform.translate(
                offset: const Offset(0, -6),
                child: Text(
                  duration,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF474747),
                  ),
                ),
              ),
            ],
          ),
        ),

        // ARRIVAL
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Arrival",
              style: TextStyle(
                color: Color(0xFF4747478F),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              arrivalTime,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              arrivalCode,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF474747),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
