import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final List<String> airlines = [
    'Jazeera Airways',
    'Kuwait Airways',
    'Fly Dubai',
    'Saudi Arabian Airlines',
    'Qatar Airways',
    'Emirates Airlines',
    'Royal Jordanian',
    'Gulf Air Company',
    'Turkish Airlines',
    'Egyptair',
    'Etihad Airways',
    'Middle East Airlines',
  ];

  final Set<int> selectedAirlines = {};

  void _reset() {
    setState(() {
      selectedAirlines.clear();
    });
  }

  void _clear() {
    setState(() {
      selectedAirlines.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.69,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              const SizedBox(height: 9),

              // Title
              const SizedBox(
                height: 18,
                child: Center(
                  child: Text(
                    'Filter Your Search',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF585858),
                    ),
                  ),
                ),
              ),

              Divider(height: 12, thickness: 1, color: Color(0xFFD9D9D9)),
              SizedBox(height: 25),
              // Airlines + Clear
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Airlines',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0862A4),
                      ),
                    ),
                    GestureDetector(
                      onTap: _clear,
                      child: const Text(
                        'Clear',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xFF474747),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 4),

              // Airline list
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: airlines.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedAirlines.contains(index);

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 19.5,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            airlines[index],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF474747),
                            ),
                          ),

                          // Checkbox
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Checkbox(
                              value: isSelected,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    selectedAirlines.add(index);
                                  } else {
                                    selectedAirlines.remove(index);
                                  }
                                });
                              },
                              side: const BorderSide(
                                color: Color(0xFF5A9BD5),
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Bottom buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19),
                child: Row(
                  children: [
                    Expanded(
                      child: _bottomButton(text: 'Reset', onTap: _reset),
                    ),
                    const SizedBox(width: 7),
                    Expanded(
                      child: _bottomButton(
                        text: 'Done',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
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
