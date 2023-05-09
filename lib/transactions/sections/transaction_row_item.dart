import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/sections/transaction_details_drawer.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';

import '../../constants/strings.dart';
import '../widgets/custom_transaction_widgets.dart';

/// A widget to display the list of transactions.
class TransactionTableRow extends StatelessWidget {
  const TransactionTableRow(
      {Key? key, required this.transaction, this.count = 0})
      : super(key: key);
  final int count;
  final List<Map> transaction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showModalSideSheet(
              context: context,
              ignoreAppBar: false,
              width: 640,
              barrierColor: Colors.white.withOpacity(0.64), // with blur,
              barrierDismissible: true,
              body: const TransactionDetailsDrawer());
          // Add what you want to do on tap
        },
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 340,
                child: TransactionColumnText(
                  textTop: transaction[count]["txnHashId"],
                  textBottom: "49 ${Strings.secAgo}",
                ),
              ),
              SizedBox(
                width: 200,
                child: TransactionColumnText(
                  textTop:
                      '${Strings.height}: ${transaction[count]['block']['height']}',
                  textBottom:
                      '${Strings.slot}: ${transaction[count]["block"]["slot"]}',
                ),
              ),
              SizedBox(
                width: 200,
                child: TransactionColumnText(
                  textTop: transaction[count]["type"],
                  textBottom: "",
                  isBottomTextRequired: false,
                ),
              ),
              SizedBox(
                width: 200,
                child: TransactionColumnText(
                    textTop:
                        '${transaction[count]["summary"]["toplValue"]} ${Strings.topl}',
                    textBottom:
                        '${transaction[count]["summary"]["bobsValue"]} ${Strings.bobs}'),
              ),
              SizedBox(
                width: 150,
                child: TransactionColumnText(
                  textTop: '${transaction[count]["fee"]} ${Strings.feeAcronym}',
                  textBottom: "",
                  isBottomTextRequired: false,
                ),
              ),
              SizedBox(
                  width: 300,
                  child: StatusButton(status: transaction[count]["status"])),
            ]));
  }
}

/// Data source class for obtaining row data for PaginatedDataTable.
class RowDataSource extends DataTableSource {
  RowDataSource(this.data, this.context, this.clr);

  BuildContext context;
  List<Map> data;
  Color clr;

  @override
  DataRow? getRow(int index) {
    final row = data[index];
    if (index < data.length) {
      return DataRow(
          color: MaterialStateProperty.all(clr),
          onLongPress: () {
            showModalSideSheet(
                context: context,
                ignoreAppBar: false,
                width: 640,
                barrierColor: Colors.white.withOpacity(0.64), // with blur,
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
