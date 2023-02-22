import 'package:flutter/material.dart';

class MetricsTile extends StatelessWidget {
  const MetricsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 363,
      height: 101,
      decoration: BoxDecoration(
        color: const Color(0xffF4f6f9),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffe2ecf9).withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 54,
            offset: const Offset(0, 9),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'The Topl Blockchain',
            style: TextStyle(color: Color(0xff161616), fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Active Chains',
                    style: TextStyle(color: Color(0xff9197b3), fontSize: 10),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '2',
                    style: TextStyle(color: Color(0xff161616), fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  height: 35,
                  child: const VerticalDivider(width: 1, color: Color.fromARGB(255, 215, 215, 215)),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Block Status',
                    style: TextStyle(color: Color(0xff9197b3), fontSize: 10),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  renderPill(const Color(0xff218e8a), const Color(0xff1d6562), 'Pending', const Color(0xffffffff))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  height: 35,
                  child: const VerticalDivider(
                    width: 1,
                    color: Color.fromARGB(255, 215, 215, 215),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Block Status',
                    style: TextStyle(color: Color(0xff9197b3), fontSize: 10),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  renderPill(const Color(0xffffffff), const Color(0xffeeeeee), 'Confirmed', const Color(0xff161616))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container renderPill(backgroundColor, borderColor, text, textColor) {
    return Container(
      width: 60,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: borderColor,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffe2ecf9).withOpacity(.4),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
