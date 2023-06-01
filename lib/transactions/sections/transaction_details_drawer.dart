import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/utils/theme_color.dart';
import 'transactions.dart';

class TransactionDetailsDrawer extends HookConsumerWidget {
  const TransactionDetailsDrawer({
    super.key,
  });

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
                'Transaction Details',
                style: TextStyle(
                    color: getSelectedColor(colorTheme, 0xFF282A2C, 0xFFFEFEFE),
                    fontFamily: 'Rational Display',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(
                    width: 172, child: CustomTextLeft(desc: 'Txn Hash/ID')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: '0x5be9d701Byd24neQfY1vXa987a'),
              ],
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'Status')),
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
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'Block')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: '242218')
              ],
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(
                    width: 172,
                    child: CustomTextLeft(desc: 'Broadcast Timestamp')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: 'UTC 16:32:01')
              ],
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(
                    width: 172,
                    child: CustomTextLeft(desc: 'Confirmed Timestamp')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: 'UTC 16:34:51')
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              // maximum width and draw line
              width: double.infinity,
              child: Divider(
                color: Color(0xFFE7E8E8),
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'Type')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: 'Transfer')
              ],
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'Amount')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: '6,215.232 TOPL')
              ],
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'Txn Fee')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: '2.1 LVL')
              ],
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'From')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: '3m21ucZ0pFyvxa1by9dnE2q87e3P6ic')
              ],
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'To')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: '7bY6Dne54qMU12cz3oPF4yVx5aG6a')
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              // maximum width and draw line
              width: double.infinity,
              child: Divider(
                color: Color(0xFFE7E8E8),
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(
                    width: 172, child: CustomTextLeft(desc: 'Size of Txn')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: '17321')
              ],
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(
                    width: 172, child: CustomTextLeft(desc: 'Proposition')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: '0x736e345d784cf4c')
              ],
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'Quantity')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: '413113 / 64.31')
              ],
            ),
            Row(
              children: [
                Spacing(),
                SizedBox(width: 172, child: CustomTextLeft(desc: 'Name')),
                SizedBox(
                  width: 24,
                ),
                CustomTextRight(desc: 'Topl / Allie')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
