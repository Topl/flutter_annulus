import 'package:flutter/material.dart';

/// Custom Status Button Widget
class StatusButton extends StatelessWidget {
  const StatusButton({super.key, this.status = "Pending"});
  final String status;

  /// Function to return color based on status
  int _color(String statusSelected) {
    if (statusSelected == "Pending") {
      return 0xFF7040EC;
    } else if (statusSelected == "Confirmed") {
      return 0xFF4BBF6B;
    } else {
      return 0xFFF07575;
    }
  }

  // Function to return icon based on status
  IconData _icon(String statusSelected) {
    if (statusSelected == "Pending") {
      return Icons.access_time;
    } else if (statusSelected == "Confirmed") {
      return Icons.check;
    } else {
      return Icons.clear;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 40.0, bottom: 16, right: 40, top: 16),
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: 160,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Color(_color(status)).withOpacity(0.04),
                // add opacity to the color
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    _icon(status),
                    color: Color(_color(status)),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Rational Display",
                      fontWeight: FontWeight.w500,
                      color: Color(_color(status)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 42.0,
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF858E8E),
            size: 14,
          ),
        ],
      ),
    );
  }
}

/// Custom Widgets - Table Header Text Widget
class TableHeaderText extends StatelessWidget {
  const TableHeaderText({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          fontFamily: "Rational Display",
          color: Color(0xFF858E8E)),
    );
  }
}

/// Custom Transaction Column Text Widget
class TransactionColumnText extends StatelessWidget {
  const TransactionColumnText({
    super.key,
    required this.textTop,
    required this.textBottom,
    this.isBottomTextRequired = true,
  });
  final String textTop;
  final String textBottom;
  final bool isBottomTextRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, bottom: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textTop,
            style: const TextStyle(
              fontSize: 16.0,
              fontFamily: "Rational Display",
              color: Color(0xFF535757),
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 5),
          isBottomTextRequired
              ? Text(
                  textBottom,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontFamily: "Rational Display",
                    color: Color(0xFF858E8E),
                    fontWeight: FontWeight.w300,
                  ),
                )
              : const SizedBox(height: 0),
        ],
      ),
    );
  }
}