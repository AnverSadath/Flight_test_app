import 'package:flutter/material.dart';

class FlightListScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<FlightListScreen> createState() => _FlightListScreenState();
}

class _FlightListScreenState extends State<FlightListScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0862A4),

        toolbarHeight: height * 0.150,
        centerTitle: true,
        title: Text(""),
        //leading icon
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 15),
        //   child: Image.asset(AppAssets.menuicon),
        // ),
        bottom: PreferredSize(preferredSize: Size(width, 0), child: Column()),
      ),

      body: Center(
        child: ClipPath(
          clipper: TicketClipper(),
          child: Container(
            width: 350,
            height: 250,
            color: Colors.white,
            child: Column(
              children: [
                const Expanded(child: Center(child: Text('Flight details'))),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: DashedDivider(),
                ),

                const SizedBox(
                  height: 44,
                  child: Center(
                    child: Text(
                      'EGP 596.230',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
