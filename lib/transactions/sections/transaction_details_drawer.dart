import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/utils/theme_color.dart';
import '../models/transaction.dart';
import '../providers/transactions_provider.dart';
import 'transactions.dart';

class TransactionDetailsDrawer extends HookConsumerWidget {
  const TransactionDetailsDrawer({super.key, this.transactionId});

  final String? transactionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final transactionNotifier = ref.watch(transactionsProvider.notifier);
    final AsyncValue<Transaction> asyncTransaction =
        transactionNotifier.getSingleTransaction(transactionId: transactionId!);

    const int textLength = 30;
    return asyncTransaction.when(
      data: (transaction) {
        return DefaultTabController(
          length: 3,
          child: Container(
            decoration: BoxDecoration(
              color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Text(
                    'Transaction Details',
                    style: TextStyle(
                        color: getSelectedColor(
                            colorTheme, 0xFF282A2C, 0xFFFEFEFE),
                        fontFamily: 'Rational Display',
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172, child: CustomTextLeft(desc: 'Txn Hash/ID')),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: CustomTextRight(
                          desc: transaction.transactionId
                              .toString()
                              .substring(0, textLength - 3)),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    SizedBox(
                        width: 172,
                        child: CustomTextLeft(desc: transaction.status.name)),
                    const SizedBox(
                      width: 24,
                    ),
                    const StatusButton(
                      status: 'Confirmed',
                      hideArrowIcon: false,
                    )
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172, child: CustomTextLeft(desc: 'Block')),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.block.epoch.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172,
                        child: CustomTextLeft(desc: 'Broadcast Timestamp')),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(
                        desc: transaction.broadcastTimestamp.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172,
                        child: CustomTextLeft(desc: 'Confirmed Timestamp')),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(
                        desc: transaction.confirmedTimestamp.toString())
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  // maximum width and draw line
                  width: double.infinity,
                  child: Divider(
                    color: Color(0xFFE7E8E8),
                    thickness: 2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172, child: CustomTextLeft(desc: 'Type')),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(
                        desc: transaction.transactionType.string.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172, child: CustomTextLeft(desc: 'Amount')),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.amount.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172, child: CustomTextLeft(desc: 'Txn Fee')),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.transactionFee.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172, child: CustomTextLeft(desc: 'From')),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.senderAddress.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172, child: CustomTextLeft(desc: 'To')),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(
                        desc: transaction.receiverAddress.toString())
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  // maximum width and draw line
                  width: double.infinity,
                  child: Divider(
                    color: Color(0xFFE7E8E8),
                    thickness: 2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172, child: CustomTextLeft(desc: 'Size of Txn')),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(
                        desc: transaction.transactionSize.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172, child: CustomTextLeft(desc: 'Proposition')),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.proposition.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172, child: CustomTextLeft(desc: 'Quantity')),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.quantity.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(
                        width: 172, child: CustomTextLeft(desc: 'Name')),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.name.toString())
                  ],
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return Text('Error occurred: $error');
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
