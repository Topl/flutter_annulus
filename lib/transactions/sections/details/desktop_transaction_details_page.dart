import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/widgets/detail_tab_bar_view.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/providers/transactions_provider.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../shared/constants/numbers.dart';
import '../transactions.dart';

//method to create a list of text widgets
List<Widget> createAddressWidgets({required List<String> addresses}) {
  return List<Widget>.generate(addresses.length, (int index) {
    return CustomTextRight(desc: addresses[index]);
  });
}

/// This is a custom widget that shows the transaction details drawer
class DesktopTransactionDetailsPage extends HookConsumerWidget {
  final String transactionId;
  const DesktopTransactionDetailsPage({
    required this.transactionId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTransaction = ref.watch(getTransactionByIdProvider(transactionId));

    return DetailTabBarView(
      data: asyncTransaction,
      child: (dynamic dTransaction) {
        final transaction = dTransaction as Transaction;
        return Align(
          alignment: Alignment.bottomRight,
          child: DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 60),
                  child: Text(
                    Strings.transactionDetailsHeader,
                    style: headlineLarge(context),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 172, child: CustomTextLeft(desc: Strings.transactionHash)),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: CustomTextRight(
                          desc: transaction.transactionId.toString().substring(0, Numbers.textLength - 4)),
                    )
                  ],
                ),
                const Row(
                  children: [
                    Spacing(),
                    SizedBox(width: 172, child: CustomTextLeft(desc: Strings.status)),
                    SizedBox(
                      width: 24,
                    ),
                    StatusButton(
                      status: 'Confirmed',
                      hideArrowIcon: false,
                    )
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 172, child: CustomTextLeft(desc: Strings.block)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.block.epoch.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 172, child: CustomTextLeft(desc: Strings.broadcastTimestamp)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.broadcastTimestamp.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 172, child: CustomTextLeft(desc: Strings.confirmedTimestamp)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.confirmedTimestamp.toString())
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
                    const SizedBox(width: 172, child: CustomTextLeft(desc: Strings.type)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.transactionType.string.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 172, child: CustomTextLeft(desc: Strings.amount)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.amount.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 172, child: CustomTextLeft(desc: Strings.txnFee)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: transaction.transactionFee.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 172, child: CustomTextLeft(desc: Strings.fromAddress)),
                    const SizedBox(
                      width: 24,
                    ),
                    ...createAddressWidgets(addresses: transaction.senderAddress),
                    // CustomTextRight(desc: transaction!.senderAddress[0])
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 172, child: CustomTextLeft(desc: Strings.toAddress)),
                    const SizedBox(
                      width: 24,
                    ),
                    ...createAddressWidgets(addresses: transaction.receiverAddress),
                    // CustomTextRight(desc: transaction!.receiverAddress[0])
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
              ],
            ),
          ),
        );
      },
    );
  }
}
