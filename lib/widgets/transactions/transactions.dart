import 'package:flutter/material.dart';
import 'package:flutter_annulus/widgets/transactions/custom_transaction_widgets.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import '../../constants/strings.dart';
import 'drawer.dart';

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

  bool viewAll = false;
  final tabs = [
    'Tab 1',
    'Tab 2',
    'Tab 3',
    'Tab 4',
    'Tab 5',
  ];

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );
    return Container(
      margin: const EdgeInsets.only(
          top: 20.0, bottom: 20.0, left: 80.0, right: 80.0),
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
            TableRow(children: [
              GestureDetector(
                  onTap: () {
                    // Add what you want to do on tap
                  },
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        TableHeaderText(name: Strings.tableHeaderTxnHashId),
                        TableHeaderText(name: Strings.tableHeaderBlock),
                        TableHeaderText(name: Strings.tableHeaderType),
                        TableHeaderText(name: Strings.tableHeaderSummary),
                        TableHeaderText(name: Strings.tableHeaderFee),
                        TableHeaderText(name: Strings.tableHeaderStatus),
                      ])),
            ]),

            /// make view all button show remaining transactions from the list
            for (var i = 0; i < transactions.length; i++)
              if (viewAll && i > 2)
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
                                body: Container(
                                  child: Row(
                                    children: [
                                      Text('Transaction Details'),
                                    ],
                                  ),
                                ));
                            // Add what you want to do on tap
                          },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                StatusButton(status: transactions[i]["status"]),
                              ]))
                    ])
              else if (i < 3)
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
                                body: Container(
                                  child: DefaultTabController(
                                    length: 3,
                                    child: Scaffold(
                                      appBar: AppBar(
                                        backgroundColor: const Color.fromRGBO(
                                            250, 250, 250, 1),
                                        elevation: 0.0,
                                        automaticallyImplyLeading: false,
                                        centerTitle: false,
                                        title: Padding(
                                          padding: const EdgeInsets.all(40.0),
                                          child: const Text(
                                            'Transaction Details',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Rational Display',
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        toolbarHeight: 80,
                                        toolbarTextStyle: const TextStyle(
                                            color: Colors.black),
                                        bottom: PreferredSize(
                                          preferredSize:
                                              const Size.fromHeight(40.0),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              child: TabBar(
                                                labelColor: Colors.black,
                                                indicatorSize:
                                                    TabBarIndicatorSize.label,
                                                indicator: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              16.0)),
                                                  color: Color(0xFFE7E8E8),
                                                ),
                                                tabs: [
                                                  Container(
                                                    width: 104.0,
                                                    height: 40.0,
                                                    child:
                                                        Tab(text: 'Overview'),
                                                  ),
                                                  Container(
                                                    width: 104.0,
                                                    height: 40.0,
                                                    child: Tab(text: 'Summary'),
                                                  ),
                                                  Container(
                                                    width: 104.0,
                                                    height: 40.0,
                                                    child: Tab(
                                                        text: 'IO Txn Details'),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      body: TabBarView(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 60,
                                                    height: 40,
                                                  ),
                                                  SizedBox(
                                                      width: 172,
                                                      child:
                                                          Text('Txn Hash/ID')),
                                                  SizedBox(
                                                    width: 24,
                                                  ),
                                                  Text(
                                                      '0x5be9d701Byd24neQfY1vXa987a'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 60,
                                                    height: 40,
                                                  ),
                                                  SizedBox(
                                                      width: 172,
                                                      child:
                                                          Text('Proposition')),
                                                  SizedBox(
                                                    width: 24,
                                                  ),
                                                  Text('0x736e345d784cf4c'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 60,
                                                    height: 40,
                                                  ),
                                                  SizedBox(
                                                      width: 172,
                                                      child: Text('Status')),
                                                  SizedBox(
                                                    width: 24,
                                                  ),
                                                  Text('Confirmed'),
                                                ],
                                              ),
                                              SizedBox(
                                                // maximum width and draw line
                                                width: double.infinity,
                                                child: Divider(
                                                  color: Color(0xFFE7E8E8),
                                                  thickness: 2,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 60,
                                                  ),
                                                  Text(
                                                    'Block',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            'Rational Display',
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 60,
                                                    height: 40,
                                                  ),
                                                  SizedBox(
                                                      width: 172,
                                                      child: Text(
                                                        'Height',
                                                      )),
                                                  SizedBox(
                                                    width: 24,
                                                  ),
                                                  Text('17,321'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 60,
                                                    height: 40,
                                                  ),
                                                  SizedBox(
                                                      width: 172,
                                                      child: Text('Slot')),
                                                  SizedBox(
                                                    width: 24,
                                                  ),
                                                  Text('1,091'),
                                                ],
                                              ),
                                              SizedBox(
                                                // maximum width and draw line
                                                width: double.infinity,
                                                child: Divider(
                                                  color: Color(0xFFE7E8E8),
                                                  thickness: 2,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 60,
                                                    height: 40,
                                                  ),
                                                  SizedBox(
                                                      width: 172,
                                                      child: Text('Type')),
                                                  SizedBox(
                                                    width: 24,
                                                  ),
                                                  Text('Transfer'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 60,
                                                    height: 40,
                                                  ),
                                                  SizedBox(
                                                      width: 172,
                                                      child:
                                                          Text('Payment Fee')),
                                                  SizedBox(
                                                    width: 24,
                                                  ),
                                                  Text('3.7 LVL'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 60,
                                                    height: 40,
                                                  ),
                                                  SizedBox(
                                                      width: 172,
                                                      child: Text(
                                                          'Broadcast Timestamp')),
                                                  SizedBox(
                                                    width: 24,
                                                  ),
                                                  Text('16:32:01'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 60,
                                                    height: 40,
                                                  ),
                                                  SizedBox(
                                                      width: 172,
                                                      child: Text(
                                                          'Confirmed Timestamp')),
                                                  SizedBox(
                                                    width: 24,
                                                  ),
                                                  Text('UTC 16:34:51'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 60,
                                                      height: 40,
                                                    ),
                                                    SizedBox(
                                                        width: 172,
                                                        child:
                                                            Text('Quantity')),
                                                    SizedBox(
                                                      width: 24,
                                                    ),
                                                    Text('413113 / 64.31'),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 60,
                                                      height: 40,
                                                    ),
                                                    SizedBox(
                                                        width: 172,
                                                        child: Text('Name')),
                                                    SizedBox(
                                                      width: 24,
                                                    ),
                                                    Text('Topl / Allie'),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 60,
                                                      height: 40,
                                                    ),
                                                    SizedBox(
                                                        width: 172,
                                                        child: Text('From')),
                                                    SizedBox(
                                                      width: 24,
                                                    ),
                                                    Text(
                                                        '3m21ucZ0pFyvxa1by9dnE2q87e3P6ic'),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 60,
                                                      height: 40,
                                                    ),
                                                    SizedBox(
                                                        width: 172,
                                                        child: Text('To')),
                                                    SizedBox(
                                                      width: 24,
                                                    ),
                                                    Text(
                                                        '7bY6Dne54qMU12cz3oPF4yVx5aG6a'),
                                                  ],
                                                )
                                              ]),
                                          Center(
                                            child: Text('IO Txn Details'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                            // Add what you want to do on tap
                          },
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                StatusButton(status: transactions[i]["status"]),
                              ]))
                    ])
          ],
        ),
        const SizedBox(height: 20.0),
        TextButton(
            onPressed: () {
              print(viewAll);
              // set the _viewAll to true
              setState(() {
                viewAll = !viewAll;
              });
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(viewAll ? "View Few Transactions" : "See All Transactions",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF535757),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(width: 10.0),
                const Icon(
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
