import 'package:flutter/material.dart';
import 'package:flutter_annulus/presentation/header.dart';
import 'package:flutter_annulus/presentation/layout.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'widgets/block_slider.dart';
import 'widgets/block_view.dart';

void main() {
  runApp(const AnnulusApp());
}

class AnnulusApp extends StatelessWidget {
  const AnnulusApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Annulus Event Explorer',
      home: CustomLayout(
        header: Header(
          logoAsset: 'images/logo.svg',
          onSearch: () {},
          dropdownItems: [],
          onDropdownChanged: (String value) {},
        ),
        content: const BlockViewSlider(),
        footer: Container(
          height: 100,
          alignment: Alignment.center,
          child: const Text("footer"),
        ),
      ),
    );
  }
}
