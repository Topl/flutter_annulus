import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/transactions/sections/transactions.dart';
import 'package:flutter_annulus/transactions/widgets/paginated_transaction_table.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../shared/constants/numbers.dart';
import '../../shared/constants/strings.dart';
import '../../shared/providers/app_theme_provider.dart';
import '../../shared/utils/theme_color.dart';
import '../../transactions/models/transaction.dart';
import '../../transactions/providers/transactions_provider.dart';
import '../../transactions/widgets/custom_transaction_widgets.dart';

/// This is a custom widget that shows the block tab bar view
class BlockTabBarView extends HookConsumerWidget {
  const BlockTabBarView({
    super.key,
    required this.block,
  });
  final Block? block;

  // create a custom tab bar view

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final AsyncValue<List<Transaction>> transactionsInfo = ref.watch(transactionsProvider);

    return TabBarView(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: isMobile ? const EdgeInsets.all(2.0) : const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 200, child: CustomTextLeft(desc: Strings.blockId)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: block!.header.substring(0, Numbers.textLength - 3)),
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 200, child: CustomTextLeft(desc: Strings.status)),
                    SizedBox(width: !isMobile ? 24 : 0),
                    const Expanded(
                      child: StatusButton(
                        status: 'Confirmed',
                        hideArrowIcon: false,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Spacing(),
                    SizedBox(width: 200, child: CustomTextLeft(desc: Strings.time)),
                    SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: '12 sec ago')
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 200, child: CustomTextLeft(desc: Strings.epoch)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: block!.epoch.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 200, child: CustomTextLeft(desc: Strings.header)),
                    const SizedBox(
                      width: 24,
                    ),
                    Expanded(child: CustomTextRight(desc: block!.header.substring(0, Numbers.textLength - 3)))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  // maximum width and draw line
                  width: double.infinity,
                  child: Divider(
                    color: Color(0xFFE7E8E8),
                    thickness: 1,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 200, child: CustomTextLeft(desc: Strings.id)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(
                        desc: isMobile
                            ? '${'0x736e345d784cf4c9'.substring(0, Numbers.textLength - 3)}...'
                            : '0x736e345d784cf4c9')
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 200, child: CustomTextLeft(desc: Strings.timeStamp)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: block!.timestamp.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 200, child: CustomTextLeft(desc: Strings.height)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: block!.height.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 200, child: CustomTextLeft(desc: Strings.size)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: block!.size.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 200, child: CustomTextLeft(desc: Strings.slot)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: block!.slot.toString())
                  ],
                ),
                Row(
                  children: [
                    const Spacing(),
                    const SizedBox(width: 200, child: CustomTextLeft(desc: Strings.numberOfTransactions)),
                    const SizedBox(
                      width: 24,
                    ),
                    CustomTextRight(desc: block!.transactionNumber.toString())
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
            ),
            padding: const EdgeInsets.only(top: 40),
            child: transactionsInfo.when(
                data: (data) {
                  return SizedBox(
                      width: 100,
                      child: SingleChildScrollView(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            cardColor: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                          ),
                          child: PaginatedTransactionTable(
                            showAllColumns: false,
                            transactions: data,
                            isTabView: true,
                          ),
                        ),
                      ));
                },
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                error: (e, s) => Center(
                      child: Text(e.toString()),
                    ))),
      ],
    );
  }
}
