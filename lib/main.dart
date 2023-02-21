import 'package:flutter/material.dart';
import 'package:flutter_annulus/presentation/blocks_view.dart';
import 'package:flutter_annulus/presentation/epochs_view.dart';
import 'package:flutter_annulus/presentation/transaction_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Annulus Event Explorer',
      home: EpochsView(),
    );
  }
}
