

import 'package:flutter/material.dart';

/// Block view widget
class BlockView extends StatelessWidget {

  const BlockView({ Key? key, required this.cardChild}) : super(key: key);
  final List<Widget> cardChild;

  @override
  Widget build(BuildContext context){
    return SizedBox(
      child: Container(
        width: 240,
        height: 344,
        margin: const EdgeInsets.only(left: 80.0, right: 0.0, bottom: 0.0),
        padding: const EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          color: const Color(0xFFE7E8E8),
          borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: const Color(0xFFE7E8E8), style: BorderStyle.solid, width: 1.0 )
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/icons/block-icon.png',
                  width: 45,
              ),
              ...cardChild]
        )
        //cardChild,
      ),
    );
  }

}