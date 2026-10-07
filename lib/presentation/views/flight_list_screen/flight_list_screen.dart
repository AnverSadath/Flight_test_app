import 'package:flight_test_app/presentation/views/flight_list_screen/filter_bottomsheet.dart';
import 'package:flight_test_app/presentation/views/flight_list_screen/flight_card.dart';
import 'package:flight_test_app/presentation/views/flight_list_screen/sort_bottom_sheet.dart';
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

  final List<String> airlineIcons = [
    "assets/images/jazeera_icon.png",
    "assets/images/flydubai_icon.png",
    "assets/images/qatar_icon.png",
    "assets/images/jazeera_icon.png",
    "assets/images/flydubai_icon.png",
    "assets/images/qatar_icon.png",
  ];

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
        itemCount: airlineIcons.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlightCard(airlineIcon: airlineIcons[index]),
          );
        },
      ),
    );
  }
}
