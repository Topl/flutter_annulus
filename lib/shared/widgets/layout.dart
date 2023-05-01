import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  final Widget header;
  final Widget content;
  final Widget footer;

  const CustomLayout(
      {super.key,
      required this.header,
      required this.content,
      required this.footer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header widget
          Container(
            color: Colors.white,
            child: header,
          ),
          // Content widget
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: content,
              ),
            ),
          ),
          // Footer widget
          Container(
            color: Colors.white,
            child: footer,
          ),
        ],
      ),
    );
  }
}
