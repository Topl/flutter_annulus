import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/sections/transaction_details_drawer.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';

import '../../constants/strings.dart';
import '../widgets/custom_transaction_widgets.dart';

/// A widget to display the list of transactions.
class TransactionTableRow extends StatelessWidget {
  const TransactionTableRow(
      {Key? key, required this.transactions, this.count = 0})
      : super(key: key);
  final int count;
  final List<Transaction> transactions;


  @override
  Widget build(BuildContext context) {
    final Transaction transaction = transactions[count];
    return GestureDetector(
        onTap: () {
          showModalSideSheet(
              context: context,
              ignoreAppBar: false,
              width: 640,
              barrierColor: Colors.white.withOpacity(0.64),
              // with blur,
              barrierDismissible: true,
              body: const TransactionDetailsDrawer());
          // Add what you want to do on tap
        },
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TransactionColumnText(
                textTop: transaction.transactionId.replaceRange(
                    16, transaction.transactionId.length, "..."),
                textBottom: "49 ${Strings.secAgo}",
              ),
              TransactionColumnText(
                textTop:
                '${Strings.height}: ${transaction.block.height}',
                textBottom:
                '${Strings.slot}: ${transaction.block.slot}',
              ),
              TransactionColumnText(
                textTop: transaction.transactionType.string,
                textBottom: "",
                isBottomTextRequired: false,
              ),
              TransactionColumnText(
                  textTop: '${transaction.quantity} ${Strings.topl}',
                  textBottom: '${transaction.amount} ${Strings.bobs}'),
              TransactionColumnText(
                textTop:
                '${transaction.transactionFee} ${Strings.feeAcronym}',
                textBottom: "",
                isBottomTextRequired: false,
              ),
              StatusButton(status: transaction.status.string),
            ]));
  }
}

/// Data source class for obtaining row data for PaginatedDataTable.
class RowDataSource extends DataTableSource {
  RowDataSource(this.data, this.context);

  BuildContext context;
  List<Map> data;

  @override
  DataRow? getRow(int index) {
    final row = data[index];
    if (index < data.length) {
      return DataRow(
          onLongPress: () {
            showModalSideSheet(
                context: context,
                ignoreAppBar: false,
                width: 640,
                barrierColor: Colors.white.withOpacity(0.64),
                // with blur,
                barrierDismissible: true,
                body: const TransactionDetailsDrawer());
            // Add what you want to do on tap
          },
          cells: <DataCell>[
            DataCell(TransactionColumnText(
              textTop: row["txnHashId"],
              textBottom: "49 ${Strings.secAgo}",
            )),
            DataCell(TransactionColumnText(
              textTop: '${Strings.height}: ${row['block']['height']}',
              textBottom: '${Strings.slot}: ${row["block"]["slot"]}',
            )),
            DataCell(TransactionColumnText(
              textTop: row["type"],
              textBottom: "",
              isBottomTextRequired: false,
            )),
            DataCell(TransactionColumnText(
                textTop: '${row["summary"]["toplValue"]} ${Strings.topl}',
                textBottom: '${row["summary"]["bobsValue"]} ${Strings.bobs}')),
            DataCell(TransactionColumnText(
              textTop: '${row["fee"]} ${Strings.feeAcronym}',
              textBottom: "",
              isBottomTextRequired: false,
            )),
            DataCell(StatusButton(status: row["status"])),
          ]);
    } else
      return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
