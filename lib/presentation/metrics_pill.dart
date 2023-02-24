import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MetricsPill extends StatelessWidget {
  const MetricsPill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xffe2ecf9).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 54,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 137,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xfff4f6f9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffe2ecf9).withOpacity(0.4),
                  spreadRadius: 0,
                  blurRadius: 54,
                  offset: const Offset(0, 9),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Block Height',
                  style: const TextStyle(color: Color(0xff9197b3), fontSize: 10),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '31034',
                  style: const TextStyle(color: Color(0xff161616), fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            width: 137,
            height: 66,
            decoration: BoxDecoration(
              color: const Color(0xff48918a),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffe2ecf9).withOpacity(0.4),
                  spreadRadius: 0,
                  blurRadius: 54,
                  offset: const Offset(0, 9),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Avg Block Time (S)',
                  style: const TextStyle(color: Color(0xffffffff), fontSize: 10),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '9.2',
                  style: const TextStyle(color: Color(0xffffffff), fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
