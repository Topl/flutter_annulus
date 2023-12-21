import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/widgets/transactions_table_headers.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vrouter/vrouter.dart';

import '../../shared/constants/strings.dart';
import '../../shared/theme.dart';
import '../../shared/utils/nav_utils.dart';
import '../../shared/utils/theme_color.dart';
import '../models/transaction.dart';
import 'custom_transaction_widgets.dart';

class TransactionsTable extends StatelessWidget {
  static Key transactionListItemKey(String transactionId) => Key('transactionListItemKey_$transactionId');

  const TransactionsTable({
    super.key,
    required this.transactions,
    required this.colorTheme,
    required this.isMobile,
    required this.isTablet,
    required this.columnHeaders,
    required this.isDesktop,
  });

  final List<Transaction> transactions;
  final ThemeMode colorTheme;
  final bool isMobile;
  final bool isTablet;
  final List<String> columnHeaders;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final tableTransactions = [];

    for (var i = 0; i < transactions.length; i++) {
      if (i == 3) {
        break;
      }
      tableTransactions.add(transactions[i]);
    }
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0, left: isMobile ? 16.0 : 40.0, right: isMobile ? 16.0 : 40.0),
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 0.0, right: 0.0),
      decoration: BoxDecoration(
        color: getSelectedColor(colorTheme, 0xFFFFFFFF, 0xFF282A2C),
        borderRadius: BorderRadius.circular(!isMobile ? 10.0 : 0.0),
        border: !isMobile
            ? Border.all(
                color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B), style: BorderStyle.solid, width: 1.0)
            : null,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: DataTable(
              horizontalMargin: 0,
              columnSpacing: 0,
              border: TableBorder.symmetric(
                inside: BorderSide(
                  color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                  width: 1,
                  style: BorderStyle.none,
                ),
              ),
              columns: columnHeaders
                  .map(
                    (columnHeader) => DataColumn(
                      label: Skeleton.keep(
                          child: TransactionTableHeader(
                              isMobile: isMobile, isTablet: isTablet, columnHeader: columnHeader)),
                    ),
                  )
                  .toList(),
              dataRowMinHeight: 80.0,
              dataRowMaxHeight: 100.0,
              showCheckboxColumn: false,
              rows: tableTransactions
                  .map(
                    (transaction) => DataRow(
                      onSelectChanged: (value) {
                        goToTransactionDetails(context: context, transaction: transaction);
                      },
                      cells: [
                        DataCell(
                          Container(
                            transform: isTablet ? Matrix4.translationValues(-15, 0, 0) : null,
                            padding: EdgeInsets.only(top: isDesktop ? 10.0 : 0.0),
                            child: TransactionColumnText(
                              key: transactionListItemKey(transaction.transactionId),
                              textTop: transaction.transactionId
                                  .replaceRange(isTablet ? 7 : 16, transaction.transactionId.length, "..."),
                              textBottom: "49 ${Strings.secAgo}",
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            transform: isTablet ? Matrix4.translationValues(-15, 0, 0) : null,
                            padding: EdgeInsets.only(top: isDesktop ? 10.0 : 0.0),
                            child: TransactionColumnText(
                              textTop: '${Strings.height}: ${transaction.block.height}',
                              textBottom: '${Strings.slot}: ${transaction.block.slot}',
                            ),
                          ),
                        ),
                        if (!isMobile)
                          DataCell(
                            Container(
                              transform: isTablet ? Matrix4.translationValues(-15, 0, 0) : null,
                              padding: EdgeInsets.only(top: isDesktop ? 10.0 : 0.0),
                              child: TransactionColumnText(
                                textTop: transaction.transactionType.string,
                                textBottom: "",
                                isBottomTextRequired: false,
                              ),
                            ),
                          ),
                        if (!isMobile)
                          DataCell(
                            Container(
                              transform: isTablet ? Matrix4.translationValues(-15, 0, 0) : null,
                              padding: EdgeInsets.only(top: isDesktop ? 10.0 : 0.0),
                              child: TransactionColumnText(
                                textTop: '${transaction.quantity} ${Strings.topl}',
                                textBottom: '${transaction.amount} ${Strings.bobs}',
                              ),
                            ),
                          ),
                        if (!isMobile)
                          DataCell(
                            Container(
                              transform: isTablet ? Matrix4.translationValues(-15, 0, 0) : null,
                              padding: EdgeInsets.only(top: isDesktop ? 10.0 : 0.0),
                              child: TransactionColumnText(
                                textTop: '${transaction.transactionFee} ${Strings.feeAcronym}',
                                textBottom: "",
                                isBottomTextRequired: false,
                              ),
                            ),
                          ),
                        if (!isMobile)
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                              ),
                              child: StatusButton(status: transaction.status.string),
                            ),
                          ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 20.0),
          Skeleton.keep(
            child: TextButton(
              onPressed: () {
                context.vRouter.to('/transactions');
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Strings.seeAllTransactions, textAlign: TextAlign.center, style: bodyMedium(context)),
                  const SizedBox(width: 10.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: getSelectedColor(colorTheme, 0xFF535757, 0xFFC0C4C4),
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
