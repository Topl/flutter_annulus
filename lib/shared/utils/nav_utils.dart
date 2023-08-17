import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/sections/block_details_drawer.dart';
import 'package:flutter_annulus/shared/constants/ui.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/sections/transaction_details_drawer.dart';
import 'package:flutter_annulus/transactions/sections/transaction_details_page.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:vrouter/vrouter.dart';

goToBlockDetails({
  required BuildContext context,
  required Block block,
  required ThemeMode colorTheme,
}) {
  final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
  isDesktop
      ? showModalSideSheet(
          context: context,
          ignoreAppBar: false,
          width: 640,
          barrierColor: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF353739).withOpacity(0.64),
          barrierDismissible: true,
          body: BlockDetailsDrawer(block: block))
      : context.vRouter.to('/block_details');
}

goToTransactionDetails({
  required BuildContext context,
  required Transaction transaction,
}) {
  final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
  if (isDesktop) {
    showModalSideSheet(
      context: context,
      ignoreAppBar: true,
      width: 640,
      barrierColor: Colors.white.withOpacity(barrierOpacity),
      // with blur,
      barrierDismissible: true,
      body: TransactionDetailsDrawer(
        transaction: transaction,
      ),
    );
  } else {
    context.vRouter.to(TransactionDetailsPage.transactionDetailsPath(transaction.transactionId));
  }
}

// TODO: Implement this
goToUtxoDetails() {}