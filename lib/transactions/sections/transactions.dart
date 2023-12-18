import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/providers/snackbar_provider.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/utils/nav_utils.dart';
import 'package:flutter_annulus/transactions/providers/transactions_provider.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:vrouter/vrouter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/constants/strings.dart';
import '../../shared/utils/theme_color.dart';
import '../models/transaction.dart';
import '../widgets/custom_transaction_widgets.dart';

/// A widget to display the list of transactions.
class Transactions extends HookConsumerWidget {
  static Key transactionListItemKey(String transactionId) => Key('transactionListItemKey_$transactionId');
  const Transactions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Transaction>> transactionsInfo = ref.watch(transactionsProvider);
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);
    final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);

    final List<String> columnHeaders = [
      Strings.tableHeaderTxnHashId,
      Strings.tableHeaderBlock,
      ...isMobile
          ? []
          : [
              Strings.tableHeaderType,
              Strings.tableHeaderSummary,
              Strings.tableHeaderFee,
              Strings.tableHeaderStatus,
            ],
    ];

    return transactionsInfo.when(
      data: (transactions) => Container(
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
                        label: Padding(
                          padding: EdgeInsets.only(
                              left: isMobile
                                  ? 0
                                  : isTablet
                                      ? 25.0
                                      : 40.0,
                              bottom: 16,
                              top: 16),
                          child: Text(
                            columnHeader,
                            style: labelLarge(context),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                dataRowMinHeight: 80.0,
                dataRowMaxHeight: 100.0,
                showCheckboxColumn: false,
                rows: transactions.sublist(0, 3).map(
                  (transaction) {
                    return DataRow(
                      onSelectChanged: (value) {
                        goToTransactionDetails(context: context, transaction: transaction);
                      },
                      cells: [
                        DataCell(Container(
                          transform: isTablet ? Matrix4.translationValues(-15, 0, 0) : null,
                          padding: EdgeInsets.only(top: isDesktop ? 10.0 : 0.0),
                          child: TransactionColumnText(
                            key: transactionListItemKey(transaction.transactionId),
                            textTop: transaction.transactionId
                                .replaceRange(isTablet ? 7 : 16, transaction.transactionId.length, "..."),
                            textBottom: "49 ${Strings.secAgo}",
                          ),
                        )),
                        DataCell(Container(
                          transform: isTablet ? Matrix4.translationValues(-15, 0, 0) : null,
                          padding: EdgeInsets.only(top: isDesktop ? 10.0 : 0.0),
                          child: TransactionColumnText(
                            textTop: '${Strings.height}: ${transaction.block.height}',
                            textBottom: '${Strings.slot}: ${transaction.block.slot}',
                          ),
                        )),
                        if (!isMobile)
                          DataCell(Container(
                            transform: isTablet ? Matrix4.translationValues(-15, 0, 0) : null,
                            padding: EdgeInsets.only(top: isDesktop ? 10.0 : 0.0),
                            child: TransactionColumnText(
                              textTop: transaction.transactionType.string,
                              textBottom: "",
                              isBottomTextRequired: false,
                            ),
                          )),
                        if (!isMobile)
                          DataCell(Container(
                            transform: isTablet ? Matrix4.translationValues(-15, 0, 0) : null,
                            padding: EdgeInsets.only(top: isDesktop ? 10.0 : 0.0),
                            child: TransactionColumnText(
                              textTop: '${transaction.quantity} ${Strings.topl}',
                              textBottom: '${transaction.amount} ${Strings.bobs}',
                            ),
                          )),
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
                          DataCell(Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                            ),
                            child: StatusButton(status: transaction.status.string),
                          )),
                      ],
                    );
                  },
                ).toList(),
              ),
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
          ],
        ),
      ),
      error: (error, stack) {
        ref.read(snackbarProvider)(context);
        return const SizedBox();
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
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
      height: 44,
    );
  }
}

class CustomTextRight extends HookConsumerWidget {
  const CustomTextRight({
    super.key,
    required this.desc,
  });

  final String desc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      desc,
      style: bodyMedium(context),
      overflow: TextOverflow.ellipsis,
    );
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
    return Text(desc, style: labelLarge(context));
  }
}
