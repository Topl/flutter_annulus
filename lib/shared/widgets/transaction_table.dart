import 'package:flutter/material.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';

import '../constants/strings.dart';
import '../widgets/transactions/custom_transaction_widgets.dart';
import '../widgets/transactions/transactions.dart';

class TransactionTable extends StatelessWidget {
  TransactionTable({super.key});
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
  bool viewAll = false;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
            padding: const EdgeInsets.only(
                left: 40.0, right: 40.0, top: 40.0, bottom: 8.0),
            child: SizedBox(
              width: 100.0,
              height: 50.0,
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        color: Color(0xFF535757),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                          color: Color(0xFF535757),
                          fontFamily: 'Rational Display',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )),
            )),
        Container(
          margin: const EdgeInsets.only(
              left: 40.0, right: 40.0, top: 8.0, bottom: 40.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border(
              top: BorderSide(
                color: Color(0xFFE7E8E8),
                width: 1,
              ),
              bottom: BorderSide(
                color: Color(0xFFE7E8E8),
                width: 1,
              ),
              left: BorderSide(
                color: Color(0xFFE7E8E8),
                width: 1,
              ),
              right: BorderSide(
                color: Color(0xFFE7E8E8),
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SizedBox(
                child: Column(children: <Widget>[
              Table(
                  border: TableBorder.symmetric(
                    inside: const BorderSide(
                      color: Color(0xFFE7E8E8),
                      width: 1,
                      style: BorderStyle.none,
                    ),
                  ),
                  defaultColumnWidth: const FlexColumnWidth(3.0),
                  columnWidths: const {
                    0: FlexColumnWidth(1.7),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(0.5),
                    5: FlexColumnWidth(1.5),
                  },
                  children: [
                    TableRow(children: [
                      GestureDetector(
                          onTap: () {
                            // Add what you want to do on tap
                          },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                TableHeaderText(
                                    name: Strings.tableHeaderTxnHashId),
                                TableHeaderText(name: Strings.tableHeaderBlock),
                                TableHeaderText(name: Strings.tableHeaderType),
                                TableHeaderText(
                                    name: Strings.tableHeaderSummary),
                                TableHeaderText(name: Strings.tableHeaderFee),
                                TableHeaderText(
                                    name: Strings.tableHeaderStatus),
                              ])),
                    ]),
                    for (var i = 0; i < transactions.length; i++) ...[
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
                            GestureDetector(
                                onTap: () {
                                  showModalSideSheet(
                                      context: context,
                                      ignoreAppBar: false,
                                      width: 640,
                                      barrierColor: Colors.white
                                          .withOpacity(0.64), // with blur,
                                      barrierDismissible: true,
                                      body: const TransactionDetailsDrawer());
                                  // Add what you want to do on tap
                                },
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TransactionColumnText(
                                        textTop: transactions[i]["txnHashId"],
                                        textBottom: "49 ${Strings.secAgo}",
                                      ),
                                      TransactionColumnText(
                                        textTop:
                                            '${Strings.height}: ${transactions[i]['block']['height']}',
                                        textBottom:
                                            '${Strings.slot}: ${transactions[i]["block"]["slot"]}',
                                      ),
                                      TransactionColumnText(
                                        textTop: transactions[i]["type"],
                                        textBottom: "",
                                        isBottomTextRequired: false,
                                      ),
                                      TransactionColumnText(
                                          textTop:
                                              '${transactions[i]["summary"]["toplValue"]} ${Strings.topl}',
                                          textBottom:
                                              '${transactions[i]["summary"]["bobsValue"]} ${Strings.bobs}'),
                                      TransactionColumnText(
                                        textTop:
                                            '${transactions[i]["fee"]} ${Strings.feeAcronym}',
                                        textBottom: "",
                                        isBottomTextRequired: false,
                                      ),
                                      StatusButton(
                                          status: transactions[i]["status"])
                                    ])),
                          ])
                    ],
                  ]),
            ])),
          ),
        )
      ],
    );
  }
}
