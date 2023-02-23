import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:bs_flutter_modal/bs_flutter_modal.dart';

class BlockHoverBubble extends StatelessWidget {
  final String blockNumber;

  const BlockHoverBubble({this.blockNumber = '', super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: 260,
            height: 24,
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
              border: Border.all(
                color: const Color(0xffeeeeee),
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.remove_red_eye,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'View block #$blockNumber',
                      style: const TextStyle(
                        color: Color(0xff161616),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -19,
            child: SizedBox(
              width: 30,
              child: ClipPolygon(
                sides: 3,
                borderRadius: 10,
                rotate: 180,
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
