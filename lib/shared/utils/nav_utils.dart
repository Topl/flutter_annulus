import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/blocks/sections/details/block_details_page.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/sections/details/transaction_details_page.dart';
import 'package:vrouter/vrouter.dart';

goToBlockDetails({
  required BuildContext context,
  required Block block,
}) {
  final chainId = context.vRouter.pathParameters[HomeScreen.chainIdParam];
  context.vRouter.to(BlockDetailsPage.blockDetailsPath(block.header, chainId!));
}

goToTransactionDetails({
  required BuildContext context,
  required Transaction transaction,
}) {
  final chainId = context.vRouter.pathParameters[HomeScreen.chainIdParam];
  context.vRouter.to(TransactionDetailsPage.transactionDetailsPath(transaction.transactionId, chainId!));
}

// TODO: Implement this
goToUtxoDetails() {}

SlideTransition slideLeftTransition(Animation<double> animation, Widget child) => SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0.5, 0),
        // end: Offset.zero,
      ).animate(animation),
      child: child,
    );
