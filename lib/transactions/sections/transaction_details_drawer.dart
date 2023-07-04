import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/constants/numbers.dart';
import '../../shared/utils/theme_color.dart';
import '../models/transaction.dart';
import 'transactions.dart';

/// This is a custom widget that shows the transaction details drawer
class TransactionDetailsDrawer extends HookConsumerWidget {
  const TransactionDetailsDrawer(
      {super.key, this.transactionId, this.transaction});

  final String? transactionId;
  final Transaction? transaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);

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
                const SizedBox(
                    width: 172,
                    child: CustomTextLeft(desc: Strings.transactionHash)),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: CustomTextRight(
                      desc: transaction!.transactionId
                          .toString()
                          .substring(0, Numbers.textLength - 4)),
                )
              ],
            ),
            const Row(
              children: [
                Spacing(),
                SizedBox(
                    width: 172, child: CustomTextLeft(desc: Strings.status)),
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
                const SizedBox(
                    width: 172, child: CustomTextLeft(desc: Strings.block)),
                const SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: transaction!.block.epoch.toString())
              ],
            ),
            Row(
              children: [
                const Spacing(),
                const SizedBox(
                    width: 172,
                    child: CustomTextLeft(desc: Strings.broadcastTimestamp)),
                const SizedBox(
                  width: 24,
                ),
                CustomTextRight(
                    desc: transaction!.broadcastTimestamp.toString())
              ],
            ),
            Row(
              children: [
                const Spacing(),
                const SizedBox(
                    width: 172,
                    child: CustomTextLeft(desc: Strings.confirmedTimestamp)),
                const SizedBox(
                  width: 24,
                ),
                CustomTextRight(
                    desc: transaction!.confirmedTimestamp.toString())
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
                    width: 172, child: CustomTextLeft(desc: Strings.type)),
                const SizedBox(
                  width: 24,
                ),
                CustomTextRight(
                    desc: transaction!.transactionType.string.toString())
              ],
            ),
            Row(
              children: [
                const Spacing(),
                const SizedBox(
                    width: 172, child: CustomTextLeft(desc: Strings.amount)),
                const SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: transaction!.amount.toString())
              ],
            ),
            Row(
              children: [
                const Spacing(),
                const SizedBox(
                    width: 172, child: CustomTextLeft(desc: Strings.txnFee)),
                const SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: transaction!.transactionFee.toString())
              ],
            ),
            Row(
              children: [
                const Spacing(),
                const SizedBox(
                    width: 172,
                    child: CustomTextLeft(desc: Strings.fromAddress)),
                const SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: transaction!.senderAddress)
              ],
            ),
            Row(
              children: [
                const Spacing(),
                const SizedBox(
                    width: 172, child: CustomTextLeft(desc: Strings.toAddress)),
                const SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: transaction!.receiverAddress)
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
  }
}
