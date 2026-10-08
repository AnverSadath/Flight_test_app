import 'package:flight_test_app/presentation/views/providers/flight_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SortBottomSheet extends StatefulWidget {
  const SortBottomSheet({super.key});

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  final List<String> options = ['Airline', 'Duration', 'Price'];

  int? selectedIndex;

  bool ascending = true;

  void _reset() {
    context.read<FlightProvider>().resetSort();
    Navigator.pop(context);
  }

  void _selectSort(int index, bool isAscending) {
    setState(() {
      selectedIndex = index;
      ascending = isAscending;
    });
  }

  void _applySort() {
    if (selectedIndex != null) {
      final provider = context.read<FlightProvider>();

      provider.sortFlights(options[selectedIndex!], ascending);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.350,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              const SizedBox(height: 10),

              // Title
              Center(
                child: Text(
                  'Sort Flight By',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF585858),
                  ),
                ),
              ),

              Divider(height: 16, thickness: 1, color: Color(0xFFD9D9D9)),

              // Sort options
              ...List.generate(options.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 19,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            options[index],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000),
                            ),
                          ),

                          Row(
                            children: [
                              // Up
                              GestureDetector(
                                onTap: () {
                                  _selectSort(index, true);
                                },
                                child: Image.asset(
                                  "assets/images/up_icon.png",
                                  width: 20,
                                  height: 20,
                                ),
                              ),

                              const SizedBox(width: 10),

                              // Down
                              GestureDetector(
                                onTap: () {
                                  _selectSort(index, false);
                                },
                                child: Image.asset(
                                  "assets/images/down_icon.png",
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Divider only between options
                      if (index != options.length - 1)
                        const Divider(
                          height: 16,
                          thickness: 1,
                          color: Color(0xFFD9D9D9),
                        ),
                    ],
                  ),
                );
              }),

              SizedBox(height: 13),
              // Bottom buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Row(
                  children: [
                    Expanded(
                      child: _bottomButton(text: 'Reset', onTap: _reset),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _bottomButton(text: 'Done', onTap: _applySort),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Close button
          Positioned(
            right: 10,
            top: -10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Color(0xFFF7941E),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, size: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomButton({required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.0542,
        width: MediaQuery.of(context).size.width * 0.459,
        decoration: BoxDecoration(
          color: const Color(0xFFF7941E),
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
