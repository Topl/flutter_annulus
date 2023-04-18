import 'package:flutter/material.dart';
import 'package:flutter_annulus/widgets/transactions/custom_transaction_widgets.dart';
import '../../constants/strings.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        print("Transaction tapped");
                        // Add what you want to do on tap
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            TransactionColumnText(
                              textTop: "0x5be9d701Byd24n...eQfY1vXa987a",
                              textBottom: "49 ${Strings.secAgo}",
                            ),
                            TransactionColumnText(
                              textTop: "${Strings.height}: 62,170",
                              textBottom: "${Strings.slot}: 1,091",
                            ),
                            TransactionColumnText(
                              textTop: "Transfer",
                              textBottom: "",
                              isBottomTextRequired: false,
                            ),
                            TransactionColumnText(
                              textTop: "6,215.232 ${Strings.topl}",
                              textBottom: "5,000.000 ${Strings.bobs}",
                            ),
                            TransactionColumnText(
                              textTop: "2.1 ${Strings.feeAcronym}",
                              textBottom: "",
                              isBottomTextRequired: false,
                            ),
                            StatusButton(status: "Pending"),
                          ])),
                ]),
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
                        // Add what you want to do on tap
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            TransactionColumnText(
                              textTop: "0x5be9d701Byd24n...eQfY1vXa987a",
                              textBottom: "49 ${Strings.secAgo}",
                            ),
                            TransactionColumnText(
                              textTop: "${Strings.height}: 62,170",
                              textBottom: "${Strings.slot}: 1,091",
                            ),
                            TransactionColumnText(
                              textTop: "Transfer",
                              textBottom: "",
                              isBottomTextRequired: false,
                            ),
                            TransactionColumnText(
                              textTop: "6,215.232 ${Strings.topl}",
                              textBottom: "5,000.000 ${Strings.bobs}",
                            ),
                            TransactionColumnText(
                              textTop: "2.1 ${Strings.feeAcronym}",
                              textBottom: "",
                              isBottomTextRequired: false,
                            ),
                            StatusButton(status: "Confirmed"),
                          ])),
                ]),
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
                        // Add what you want to do on tap
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            TransactionColumnText(
                              textTop: "0x5be9d701Byd24n...eQfY1vXa987a",
                              textBottom: "49 ${Strings.secAgo}",
                            ),
                            TransactionColumnText(
                              textTop: "${Strings.height}: 62,170",
                              textBottom: "${Strings.slot}: 1,091",
                            ),
                            TransactionColumnText(
                              textTop: "Transfer",
                              textBottom: "",
                              isBottomTextRequired: false,
                            ),
                            TransactionColumnText(
                              textTop: "6,215.232 ${Strings.topl}",
                              textBottom: "5,000.000 ${Strings.bobs}",
                            ),
                            TransactionColumnText(
                              textTop: "2.1 ${Strings.feeAcronym}",
                              textBottom: "",
                              isBottomTextRequired: false,
                            ),
                            StatusButton(status: "Failed"),
                          ]))
                ]),
          ],
        ),
        const SizedBox(height: 20.0),
        TextButton(
            onPressed: null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("See All Transactions",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF535757),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(width: 10.0),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF535757),
                  size: 14,
                ),
              ],
            ))
      ]),
    );
  }
}
