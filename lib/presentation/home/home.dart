import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/presentation/home/metrics_pill.dart';
import 'package:flutter_annulus/presentation/home/transaction_stack.dart';
import 'package:ribn_toolkit/widgets/molecules/wave_container.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6f9),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            Image.asset(
              'assets/icons/leaves-logo.png',
              width: 45,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              widget.title,
              style: const TextStyle(color: Color(0xff165867)),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              color: const Color(0xfff4f6f9).withOpacity(1),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              WaveContainer(
                containerHeight: MediaQuery.of(context).size.height * .5,
                containerWidth: MediaQuery.of(context).size.width,
                waveAmplitude: 30,
                containerChild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      MetricsPill(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ListView(
            padding: const EdgeInsets.only(top: 86),
            scrollDirection: Axis.horizontal,
            children: const [
              SizedBox(
                width: 550,
                child: Center(
                  child: SingleChildScrollView(
                    child: TransactionStack(),
                  ),
                ),
              ),
              SizedBox(
                width: 550,
                child: Center(
                  child: SingleChildScrollView(
                    child: TransactionStack(),
                  ),
                ),
              ),
              SizedBox(
                width: 550,
                child: Center(
                  child: SingleChildScrollView(
                    child: TransactionStack(),
                  ),
                ),
              ),
              SizedBox(
                width: 550,
                child: Center(
                  child: SingleChildScrollView(
                    child: TransactionStack(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
