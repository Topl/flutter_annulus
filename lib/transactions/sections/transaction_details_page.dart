import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/sections/desktop_transaction_details_page.dart';
import 'package:flutter_annulus/transactions/sections/mobile_transaction_details_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:vrouter/vrouter.dart';

/// This is a custom widget that shows the transaction details page
class TransactionDetailsPage extends HookConsumerWidget {
  const TransactionDetailsPage({
    Key? key,
  }) : super(key: key);

  static const String transactionIdParam = 'transactionId';
  static const String route = '/transactions_details/';
  static const String paramRoute = '$route:$transactionIdParam';
  static String transactionDetailsPath(String transactionId) {
    return '$route$transactionId';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? transactionId = context.vRouter.pathParameters[transactionIdParam];
    final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);

    if (transactionId == null) {
      context.vRouter.to('/');
    }

    if (isDesktop) {
      return DesktopTransactionDetailsPage(
        transactionId: transactionId!,
      );
    } else {
      return MobileTransactionDetailsPage(
        transactionId: transactionId!,
      );
    }
  }
}
