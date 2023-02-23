import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:bs_flutter_modal/bs_flutter_modal.dart';

class BlockHeaderBubble extends StatelessWidget {
  const BlockHeaderBubble({super.key});

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
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => BsModal(
                            context: context,
                            dialog: BsModalDialog(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              child: Container(
                                width: 400,
                                height: 94,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: const Color(0xffdee2e6),
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 24.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: const Color(0xffe3e3e3),
                                                width: 1,
                                              ),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color(0xffc8c8c8),
                                                  spreadRadius: 0,
                                                  blurRadius: 30,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                            child: Image.asset('assets/icons/tick-clock.png'),
                                          ),
                                        ],
                                      ),
                                      const Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20.0),
                                          child: Center(
                                            child: Text(
                                              'The Tick chain is a sequence of block headers that are created every x slots (aka ticks).',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff9197b3),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                radius: 16,
                                                backgroundColor: const Color(0xffE5E5E5),
                                                child: IconButton(
                                                  iconSize: 17,
                                                  icon: const Icon(Icons.close_rounded, color: Color(0xff4F4F4F)),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
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
