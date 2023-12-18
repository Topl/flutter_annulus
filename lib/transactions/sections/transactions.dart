import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/transactions/providers/transactions_provider.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/constants/strings.dart';
import '../models/transaction.dart';
import '../utils/utils.dart';
import '../widgets/transactions_table.dart';

/// A widget to display the list of transactions.
class Transactions extends HookConsumerWidget {
  static Key transactionListItemKey(String transactionId) => Key('transactionListItemKey_$transactionId');
  static const Key loadingTransactionsKey = Key('LoadingTransactionsKey');
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
      data: (transactions) => TransactionsTable(
        transactions: transactions,
        colorTheme: colorTheme,
        isMobile: isMobile,
        isTablet: isTablet,
        columnHeaders: columnHeaders,
        isDesktop: isDesktop,
      ),
      error: (error, stack) {
        return const Text('Oops, something unexpected happened');
      },
      loading: () {
        final mockTransactions = List.generate(5, (index) => getMockTransaction(index));
        return Skeletonizer(
            key: loadingTransactionsKey,
            child: TransactionsTable(
              transactions: mockTransactions,
              colorTheme: colorTheme,
              isMobile: isMobile,
              isTablet: isTablet,
              columnHeaders: columnHeaders,
              isDesktop: isDesktop,
            ));
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
