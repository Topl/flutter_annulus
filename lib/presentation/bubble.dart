import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class Bubble extends StatelessWidget {
  const Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 110,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xffF4f6f9),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffe2ecf9).withOpacity(.4),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/tick-clock.png',
                  width: 40,
                  height: 40,
                ),
                const Text(
                  'Ticks',
                  style: TextStyle(
                    color: Color(0xff161616),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  iconSize: 16,
                  color: const Color(0xff161616),
                  onPressed: () {},
                  icon: const Icon(Icons.info),
                ),
              ],
            ),
          ),
          Positioned(
            left: 84,
            top: 30,
            child: SizedBox(
              width: 58,
              child: ClipPolygon(
                sides: 3,
                borderRadius: 10,
                rotate: 90.0,
                boxShadows: [
                  // PolygonBoxShadow(color: Color(0xffe2ecf9).withOpacity(.4), elevation: 5),
                ],
                child: Container(
                  color: const Color(0xffF4f6f9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
