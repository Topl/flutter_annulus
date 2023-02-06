import 'package:flutter/material.dart';

class TransactionCard {
  final DateTime date;
  final Widget leading;
  final String title;
  final String subtitle;

  const TransactionCard({
    required this.date,
    required this.leading,
    required this.title,
    required this.subtitle,
  });
}
