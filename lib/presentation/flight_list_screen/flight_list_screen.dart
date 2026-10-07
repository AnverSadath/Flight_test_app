import 'package:flight_test_app/presentation/flight_list_screen/filter_bottomsheet.dart';
import 'package:flight_test_app/presentation/flight_list_screen/sort_bottom_sheet.dart';
import 'package:flutter/material.dart';

class FlightListScreen extends StatefulWidget {
  const FlightListScreen({super.key});

  @override
  State<FlightListScreen> createState() => _FlightListScreenState();
}

class _FlightListScreenState extends State<FlightListScreen> {
  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FilterBottomSheet();
      },
    );
  }

  void _showSortBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SortBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.523,
        height: MediaQuery.of(context).size.height * 0.0603,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF7941E),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 1,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: _showSortBottomSheet,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/sort_icon.png",
                      width: 22,
                      height: 22,
                    ),
                    Text(
                      "Sort",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: 1,
                height: 40,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),

              GestureDetector(
                onTap: _showFilterBottomSheet,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/filter_icon.png",
                      width: 22,
                      height: 22,
                    ),
                    Text(
                      "Filter",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0862A4),
        toolbarHeight: height * 0.150,
        centerTitle: true,
        title: Column(
          children: [
            SizedBox(height: height * 0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_back, color: Colors.white, size: 30),

                Row(
                  children: [
                    const Text(
                      "NZ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "assets/images/line.png",
                          width: 80,
                          height: 24,
                        ),
                        Image.asset(
                          "assets/images/aeroplane_icon.png",
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),

                    const Text(
                      "CAI",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                Image.asset(
                  "assets/images/edit_icon.png",
                  width: 24,
                  height: 24,
                ),
              ],
            ),

            SizedBox(height: height * 0.013),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "17 October",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Container(
                  width: 1,
                  height: 12,
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                ),

                const Text(
                  "2 Travellers",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                Container(
                  width: 1,
                  height: 12,
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                ),

                const Text(
                  "25 Flights",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
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
                            padding: const EdgeInsets.only(
                              left: 13,
                              right: 18,
                              top: 20,
                            ),

                            child: Column(
                              children: [
                                // FIRST FLIGHT ROW
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      "assets/images/jazeera_icon.png",
                                    ),

                                    // Departure
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Departure",
                                          style: TextStyle(
                                            color: Color(0xFF4747478F),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),

                                        const Text(
                                          "21:30",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),

                                        const Text(
                                          "DXB",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF474747),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Route
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Transform.translate(
                                            offset: const Offset(0, 6),
                                            child: const Text(
                                              "RUH",
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF474747),
                                              ),
                                            ),
                                          ),

                                          const SizedBox(height: 0),

                                          SizedBox(
                                            width: 105,
                                            height: 24,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              clipBehavior: Clip.none,
                                              children: [
                                                // Line
                                                Image.asset(
                                                  "assets/images/line_2.png",
                                                  width: 105,
                                                ),

                                                // Start
                                                Positioned(
                                                  left: -9,
                                                  child: Image.asset(
                                                    "assets/images/round_icon.png",
                                                    width: 25,
                                                    height: 24,
                                                  ),
                                                ),

                                                // Middle rectangle
                                                Positioned(
                                                  left: 40,
                                                  child: Container(
                                                    width: 25,
                                                    height: 4,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6,
                                                          ),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                        color: const Color(
                                                          0xFF969696,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                // End
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

                                          const SizedBox(height: 0),

                                          Transform.translate(
                                            offset: const Offset(0, -6),
                                            child: const Text(
                                              "06H:0M",
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF474747),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Arrival
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "Arrival",
                                          style: TextStyle(
                                            color: Color(0xFF4747478F),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),

                                        const Text(
                                          "08:30",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),

                                        const Text(
                                          "CAI",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF474747),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 19),

                                // SECOND FLIGHT ROW
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(
                                      "assets/images/jazeera_icon.png",
                                    ),

                                    // Departure
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Departure",
                                          style: TextStyle(
                                            color: Color(0xFF4747478F),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),

                                        const Text(
                                          "21:30",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),

                                        const Text(
                                          "DXB",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF474747),
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Route
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Transform.translate(
                                            offset: const Offset(0, 6),
                                            child: const Text(
                                              "RUH",
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF474747),
                                              ),
                                            ),
                                          ),

                                          const SizedBox(height: 0),

                                          SizedBox(
                                            width: 105,
                                            height: 24,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              clipBehavior: Clip.none,
                                              children: [
                                                // Line
                                                Image.asset(
                                                  "assets/images/line_2.png",
                                                  width: 105,
                                                ),

                                                // Start
                                                Positioned(
                                                  left: -9,
                                                  child: Image.asset(
                                                    "assets/images/round_icon.png",
                                                    width: 25,
                                                    height: 24,
                                                  ),
                                                ),

                                                // Middle rectangle
                                                Positioned(
                                                  left: 40,
                                                  child: Container(
                                                    width: 25,
                                                    height: 4,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6,
                                                          ),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                        color: const Color(
                                                          0xFF969696,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                // End
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

                                          const SizedBox(height: 0),

                                          Transform.translate(
                                            offset: const Offset(0, -6),
                                            child: const Text(
                                              "06H:0M",
                                              style: TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF474747),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Arrival
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "Arrival",
                                          style: TextStyle(
                                            color: Color(0xFF4747478F),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),

                                        const Text(
                                          "08:30",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),

                                        const Text(
                                          "CAI",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF474747),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // PERMANENT BOTTOM DASHED LINE
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
                                Center(
                                  child: Text(
                                    'EGP 596.230',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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

    final finalPath = Path.combine(
      PathOperation.difference,
      leftResult,
      rightCutout,
    );

    return finalPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
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

// DASHED LINE PAINTER
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
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
