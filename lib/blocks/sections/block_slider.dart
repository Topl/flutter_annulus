import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/block_slider/block_view.dart';

class BlockViewSlider extends StatefulWidget {
  const BlockViewSlider({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BlockViewSliderState();
  }
}

class _BlockViewSliderState extends State<BlockViewSlider> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

// read dummy json data for blocks
  static const List<dynamic> blocks = [
    {"hash": "h1000", "height": "1000", "time": "16:32:00", "size": "1000", "epoch": "E100", "header": "h1000"},
    {"hash": "h1001", "height": "1001", "time": "16:32:05", "size": "1001", "epoch": "E100", "header": "h1001"},
    {"hash": "h1002", "height": "1002", "time": "16:32:50", "size": "1002", "epoch": "E100", "header": "h1002"},
    {"hash": "h1008", "height": "1008", "time": "16:32:56", "size": "1008", "epoch": "E100", "header": "h1008"},
    {"hash": "h1009", "height": "1009", "time": "16:35:45", "size": "1009", "epoch": "E100", "header": "h1009"},
    {"hash": "h10010", "height": "10010", "time": "16:34:45", "size": "10010", "epoch": "E100", "header": "h10010"},
    {"hash": "h10011", "height": "10011", "time": "16:37:00", "size": "10011", "epoch": "E100", "header": "h10011"}
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, left: 80.0, right: 80.0),
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 30.0, left: 0.0, right: 0.0),
        //height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: const Color(0xFFE7E8E8), style: BorderStyle.solid, width: 1.0),
        ),
        child: Wrap(
          // direction: Axis.vertical,
          children: <Widget>[
            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                BlockPlaceHolder(controller: _controller),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: CarouselSlider.builder(
                    itemBuilder: (context, index, realIdx) {
                      final int first = index * 2;
                      final int second = first + 1;
                      final int third = second + 1;
                      final int fourth = third + 1;
                      final int firth = fourth + 1;
                      return Wrap(
                        direction: Axis.vertical, // main axis (rows or columns)
                        children: <Widget>[
                          VisibleBlockView(
                            n1: first,
                            n2: second,
                            n3: third,
                            n4: fourth,
                            n5: firth,
                            blocks: blocks,
                          ),
                        ],
                      );
                    },
                    itemCount: (blocks.length / 3).round(),
                    options: CarouselOptions(
                        aspectRatio: 0.6,
                        initialPage: 0,
                        padEnds: false,
                        enlargeCenterPage: true,
                        animateToClosest: true,
                        viewportFraction: 1,
                        height: 360),
                    carouselController: _controller,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Widget for the visible block view
class BlockPlaceHolder extends StatelessWidget {
  const BlockPlaceHolder({
    super.key,
    required CarouselController controller,
  }) : _controller = controller;

  final CarouselController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Latest Blocks",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Color(0xFF282A2C), fontFamily: "Rational Display"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Multiple-chain Embedding",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF858E8E), fontFamily: "Rational Display")),
          const SizedBox(
            height: 168,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: CustomTextButton(controller: _controller, text: '←'),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: CustomTextButton(controller: _controller, text: '→'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Text Button widget
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required CarouselController controller,
    required this.text,
  }) : _controller = controller;

  final String text;
  final CarouselController _controller;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: const Size(56, 56),
        textStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: const Color(0xFFE2E3E3),
      ),
      onPressed: () => _controller.previousPage(),
      child: Text(text,
          style: const TextStyle(
            color: Color(0xFF535757),
          )),
    );
  }
}

// Widget for the visible block view
class VisibleBlockView extends StatelessWidget {
  const VisibleBlockView({
    super.key,
    required this.n1,
    required this.n2,
    required this.n3,
    required this.n4,
    required this.n5,
    required this.blocks,
  });

  final int n1;
  final int n2;
  final int n3;
  final int n4;
  final int n5;
  final List blocks;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [n1, n2, n3, n4, n5].map((idx) {
      return BlockView(
        blockEpoch: blocks[idx]["epoch"],
        blockHeight: blocks[idx]["height"],
        blockTime: blocks[idx]["time"],
        blockHeader: blocks[idx]["header"],
      );
    }).toList());
  }
}
