import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/sections/transaction_details_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:vrouter/vrouter.dart';

import '../../shared/constants/strings.dart';
import '../widgets/custom_transaction_widgets.dart';

/// A widget to display the list of transactions.
class TransactionTableRow extends HookConsumerWidget {
  const TransactionTableRow(
      {Key? key, required this.transactions, this.count = 0})
      : super(key: key);
  final int count;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Transaction transaction = transactions[count];
    final isLargerScreen =
        ResponsiveBreakpoints.of(context).largerThan(DESKTOP);
    final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    return GestureDetector(
      onTap: () {
        if (isDesktop) {
          showModalSideSheet(
              context: context,
              ignoreAppBar: false,
              width: 640,
              barrierColor: Colors.white.withOpacity(0.64),
              barrierDismissible: true,
              body: TransactionDetailsDrawer(
                transactionId: transaction.transactionId,
              ));
        } else {
          context.vRouter.to('/transactions_details/:transactionId');
        }
        // Add what you want to do on tap
      },
      child: Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: isMobile
              ? 170
              : isLargerScreen
                  ? 750
                  : 300,
          child: TransactionColumnText(
            textTop: transaction.transactionId
                .replaceRange(25, transaction.transactionId.length, "..."),
            textBottom: "49 ${Strings.secAgo}",
          ),
        ),
        if (isMobile)
          const SizedBox(
            width: 30,
          ),
        SizedBox(
          width: isMobile ? 100 : 200,
          child: TransactionColumnText(
            textTop: '${Strings.height}: ${transaction.block.height}',
            textBottom: '${Strings.slot}: ${transaction.block.slot}',
          ),
        ),
        if (!isMobile)
          SizedBox(
            width: 200,
            child: TransactionColumnText(
              textTop: transaction.transactionType.string,
              textBottom: "",
              isBottomTextRequired: false,
            ),
          ),
        if (!isMobile)
          SizedBox(
            width: 200,
            child: TransactionColumnText(
                textTop: '${transaction.quantity} ${Strings.topl}',
                textBottom: '${transaction.amount} ${Strings.bobs}'),
          ),
        if (!isMobile)
          SizedBox(
            width: 150,
            child: TransactionColumnText(
              textTop: '${transaction.transactionFee} ${Strings.feeAcronym}',
              textBottom: "",
              isBottomTextRequired: false,
            ),
          ),
        if (!isMobile)
          SizedBox(
              width: 300,
              child: StatusButton(status: transaction.status.string)),
      ])),
    );
  }
}

/// Data source class for obtaining row data for PaginatedDataTable.
class RowDataSource extends DataTableSource {
  RowDataSource(this.data, this.context, this.clr);

  BuildContext context;
  List<Transaction> data;
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
                barrierColor: Colors.white.withOpacity(0.64),
                // with blur,
                barrierDismissible: true,
                body: const TransactionDetailsDrawer());
            // Add what you want to do on tap
          },
          cells: <DataCell>[
            DataCell(GestureDetector(
              onTap: () {
                context.vRouter.to(
                  '/transactions_details/${row.transactionId}',
                );
              },
              child: TransactionColumnText(
                textTop: row.transactionId,
                textBottom: "49 ${Strings.secAgo}",
              ),
            )),
            DataCell(TransactionColumnText(
              textTop: '${Strings.height}: ${row.block.height}',
              textBottom: '${Strings.slot}: ${row.block.slot}',
            )),
            DataCell(TransactionColumnText(
              textTop: row.transactionType.string,
              textBottom: "",
              isBottomTextRequired: false,
            )),
            const DataCell(TransactionColumnText(
                textTop: '3 ${Strings.topl}',
                textBottom: '44 ${Strings.bobs}')),
            DataCell(TransactionColumnText(
              textTop: '${row.transactionFee} ${Strings.feeAcronym}',
              textBottom: "",
              isBottomTextRequired: false,
            )),
            DataCell(StatusButton(status: row.status.string)),
          ]);
    } else {
      return null;
    }
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
