import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/sections/transaction_table_header.dart';
import 'package:flutter_annulus/transactions/sections/transaction_row_item.dart';
import 'package:vrouter/vrouter.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

/// A widget to display the list of transactions.
class _TransactionsState extends State<Transactions> {
  static const List<Map> transactions = [
    {
      "txnHashId": "0x5be9d701Byd24n...eQfY1vXa987a",
      "type": "Transfer",
      "fee": "2.3",
      "status": "Pending",
      "block": {
        "height": "45,101",
        "slot": "1,0297",
      },
      "summary": {
        "toplValue": "2,450.400",
        "bobsValue": "1,000.001",
      }
    },
    {
      "txnHashId": "0x5be9d701Byd24n...eQfY1vXa987a",
      "type": "Transfer",
      "fee": "2.3",
      "status": "Confirmed",
      "block": {
        "height": "45,102",
        "slot": "1,0297",
      },
      "summary": {
        "toplValue": "2,450.400",
        "bobsValue": "1,000.002",
      }
    },
    {
      "txnHashId": "0x5be9d701Byd24n...eQfY1vXa987a",
      "type": "Transfer",
      "fee": "2.3",
      "status": "Failed",
      "block": {
        "height": "45,103",
        "slot": "1,0297",
      },
      "summary": {
        "toplValue": "2,450.400",
        "bobsValue": "1,000.003",
      }
    },
    {
      "txnHashId": "0x5be9d701Byd24n...eQfY1vXa987a",
      "type": "Transfer",
      "fee": "2.3",
      "status": "Confirmed",
      "block": {
        "height": "45,104",
        "slot": "1,0297",
      },
      "summary": {
        "toplValue": "2,450.400",
        "bobsValue": "1,000.004",
      }
    },
    {
      "txnHashId": "0x5be9d701Byd24n...eQfY1vXa987a",
      "type": "Transfer",
      "fee": "2.3",
      "status": "Confirmed",
      "block": {
        "height": "45,105",
        "slot": "1,0297",
      },
      "summary": {
        "toplValue": "2,450.400",
        "bobsValue": "1,000.005",
      }
    },
  ];

  final tabs = [
    'Tab 1',
    'Tab 2',
    'Tab 3',
    'Tab 4',
    'Tab 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: 20.0, bottom: 20.0, left: 40.0, right: 40.0),
      padding:
          const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 0.0, right: 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
            color: const Color(0xFFE7E8E8),
            style: BorderStyle.solid,
            width: 1.0),
      ),
      child: Column(children: <Widget>[
        Table(
          border: TableBorder.symmetric(
            inside: const BorderSide(
              color: Color(0xFFE7E8E8),
              width: 1,
              style: BorderStyle.none,
            ),
          ),
          columnWidths: const {
            0: FlexColumnWidth(1.7),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
            3: FlexColumnWidth(1),
            4: FlexColumnWidth(0.5),
            5: FlexColumnWidth(1.5),
          },
          children: [
            const TableRow(children: [
              TransactionTableHeader(),
            ]),

            /// make view all button show remaining transactions from the list
            for (var i = 0; i < transactions.length; i++)
              if (i < 3)
                TableRow(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            style: BorderStyle.solid,
                            width: 1.0,
                            color: Color(0xFFE7E8E8)),
                      ),
                    ),
                    children: [
                      TransactionTableRow(transaction: transactions, count: i)
                    ])
          ],
        ),
        const SizedBox(height: 20.0),
        TextButton(
            onPressed: () {
              context.vRouter.to('/transactions');
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("See All Transactions",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF535757),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Rational Display',
                    )),
                SizedBox(width: 10.0),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF535757),
                  size: 14,
                ),
              ],
            )),
      ]),
    );
  }
}

class Spacing extends StatelessWidget {
  const Spacing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 60,
      height: 40,
    );
  }
}

class CustomTextRight extends StatelessWidget {
  const CustomTextRight({
    super.key,
    required this.desc,
  });

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Text(desc,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Color(0xFF282A2C),
          fontSize: 16,
          fontFamily: 'Rational Display Light',
          fontStyle: FontStyle.normal,
        ));
  }
}

class CustomTextLeft extends StatelessWidget {
  const CustomTextLeft({
    super.key,
    required this.desc,
  });

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Text(desc,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xFF858E8E),
          fontFamily: 'Rational Display Light',
          fontStyle: FontStyle.normal,
        ));
  }
}
