import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/sections/transaction_details_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:vrouter/vrouter.dart';

import '../../shared/constants/strings.dart';
import '../../shared/constants/ui.dart';
import '../widgets/custom_transaction_widgets.dart';

/// A widget to display the list of transactions.
class TransactionTableRow extends HookConsumerWidget {
  const TransactionTableRow({Key? key, required this.transactions, this.count = 0}) : super(key: key);
  final int count;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Transaction transaction = transactions[count];
    final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);
    final isResponsive = ResponsiveBreakpoints.of(context).smallerOrEqualTo(TABLET);

    return GestureDetector(
        onTap: () {
          if (isDesktop) {
            showModalSideSheet(
                context: context,
                ignoreAppBar: false,
                width: 640,
                barrierColor: Colors.white.withOpacity(barrierOpacity),
                barrierDismissible: true,
                body: TransactionDetailsDrawer(
                  transaction: transaction,
                ));
          } else {
            context.vRouter.to('/transactions_details/');
          }
          // Add what you want to do on tap
        },
        child: Row(
            mainAxisAlignment: isDesktop ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: isTablet
                    ? 130
                    : isMobile
                        ? 170
                        : 450,
                child: TransactionColumnText(
                  isTransactionTable: false,
                  textTop: transaction.transactionId.replaceRange(
                      isTablet
                          ? 7
                          : isDesktop
                              ? 38
                              : 16,
                      transaction.transactionId.length,
                      "..."),
                  textBottom: "49 ${Strings.secAgo}",
                  isSmallFont: true,
                ),
              ),
              if (isMobile)
                const SizedBox(
                  width: 30,
                ),
              SizedBox(
                width: isResponsive
                    ? 100
                    : isDesktop
                        ? 150
                        : 200,
                child: TransactionColumnText(
                  isTransactionTable: false,
                  textTop: '${Strings.height}: ${transaction.block.height}',
                  textBottom: '${Strings.slot}: ${transaction.block.slot}',
                ),
              ),
              if (!isMobile)
                SizedBox(
                  width: isTablet
                      ? 110
                      : isDesktop
                          ? 150
                          : 200,
                  child: TransactionColumnText(
                    isTransactionTable: false,
                    textTop: transaction.transactionType.string,
                    textBottom: "",
                    isBottomTextRequired: false,
                  ),
                ),
              if (!isMobile)
                SizedBox(
                  width: isTablet
                      ? 90
                      : isDesktop
                          ? 150
                          : 200,
                  child: TransactionColumnText(
                      isTransactionTable: false,
                      textTop: '${transaction.quantity} ${Strings.topl}',
                      textBottom: '${transaction.amount} ${Strings.bobs}'),
                ),
              if (!isMobile)
                SizedBox(
                  width: isTablet ? 110 : 150,
                  child: TransactionColumnText(
                    isTransactionTable: false,
                    textTop: '${transaction.transactionFee} ${Strings.feeAcronym}',
                    textBottom: "",
                    isBottomTextRequired: false,
                  ),
                ),
              if (!isMobile)
                SizedBox(
                    width: isTablet ? 85 : 300,
                    child: StatusButton(isTransactionTable: true, status: transaction.status.string)),
            ]));
  }
}
