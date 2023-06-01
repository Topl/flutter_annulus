import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/transactions/providers/transactions_provider.dart';
import 'package:flutter_annulus/transactions/sections/transaction_table_header.dart';
import 'package:flutter_annulus/transactions/sections/transaction_row_item.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:vrouter/vrouter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/theme_color.dart';
import '../models/transaction.dart';

/// A widget to display the list of transactions.
class Transactions extends HookConsumerWidget {
  Transactions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Transaction>> transactionsInfo =
        ref.watch(transactionsProvider);
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    return transactionsInfo.when(
      data: (transactions) => Container(
        margin: EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
            left: isMobile ? 16.0 : 40.0,
            right: isMobile ? 16.0 : 40.0),
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, left: 0.0, right: 0.0),
        decoration: BoxDecoration(
          color: getSelectedColor(colorTheme, 0xFFFFFFFF, 0xFF282A2C),
          borderRadius: BorderRadius.circular(!isMobile ? 10.0 : 0.0),
          border: !isMobile
              ? Border.all(
                  color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                  style: BorderStyle.solid,
                  width: 1.0)
              : null,
        ),
        child: Column(children: <Widget>[
          Table(
            border: TableBorder.symmetric(
              inside: BorderSide(
                color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFF4B4B4B),
                width: 1,
                style: BorderStyle.none,
              ),
            ),
            columnWidths: const {
              0: FlexColumnWidth(1.5),
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
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              style: BorderStyle.solid,
                              width: 1.0,
                              color: getSelectedColor(
                                  colorTheme, 0xFFE7E8E8, 0xFF4B4B4B))),
                    ),
                    children: [
                      TransactionTableRow(transactions: transactions, count: i)
                    ],
                  )
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
                children: [
                  Text("See All Transactions",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: getSelectedColor(
                            colorTheme, 0xFF535757, 0xFFC0C4C4),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Rational Display',
                      )),
                  const SizedBox(width: 10.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: getSelectedColor(colorTheme, 0xFF535757, 0xFFC0C4C4),
                    size: 14,
                  ),
                ],
              )),
        ]),
      ),
      error: (error, stack) =>
          const Text('Oops, something unexpected happened'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
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
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final colorMode = ref.watch(appThemeColorProvider);
    return Text(desc,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: getSelectedColor(colorMode, 0xFF282A2C, 0xFFFEFEFE),
          fontSize: isMobile ? 13 : 16,
          fontFamily: 'Rational Display',
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
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    return Text(desc,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: isMobile ? 14 : 16,
          color: const Color(0xFF858E8E),
          fontFamily: 'Rational Display Light',
          fontStyle: FontStyle.normal,
        ));
  }
}
