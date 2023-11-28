import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/providers/block_provider.dart';
import 'package:flutter_annulus/blocks/widgets/custom_block_widgets.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/widgets/footer.dart';
import 'package:flutter_annulus/shared/widgets/header.dart';
import 'package:flutter_annulus/shared/widgets/layout.dart';
import 'package:flutter_annulus/transactions/widgets/paginated_transaction_table.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';

import '../../../shared/providers/app_theme_provider.dart';
import '../../../shared/utils/theme_color.dart';
import '../../../transactions/models/transaction.dart';
import '../../../transactions/providers/transactions_provider.dart';
import '../../../transactions/widgets/custom_transaction_widgets.dart';

// This is the block_details widget that is shown when the user clicks on the block on mobile
class MobileBlockDetailsPage extends HookConsumerWidget {
  const MobileBlockDetailsPage({
    super.key,
    required this.blockId,
  });

  final String blockId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncBlock = ref.watch(getBlockByIdProvider(blockId));

    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final AsyncValue<List<Transaction>> transactionsInfo = ref.watch(transactionsProvider);

    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);
    return asyncBlock.when(data: (block) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            children: [
              CustomLayout(
                  header: Header(
                    logoAsset: colorTheme == ThemeMode.light ? 'assets/icons/logo.svg' : 'assets/icons/logo_dark.svg',
                    onSearch: () {},
                    onDropdownChanged: (String value) {},
                  ),
                  content: Column(
                    children: [
                      Container(
                        height: isTablet ? MediaQuery.of(context).size.height - 280 : null,
                        decoration: BoxDecoration(
                          color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                        ),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                            child: SizedBox(
                          height: MediaQuery.of(context).size.width == 1024
                              ? MediaQuery.of(context).size.height - 300
                              : null,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  CustomTabBar(colorTheme: colorTheme),
                                  SingleChildScrollView(
                                    child: CustomContainer(
                                        child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomResponsiveRowColumn(children: [
                                          ResponsiveRowColumnItem(
                                            child: CustomPadding(
                                              child: isMobile
                                                  ? CustomColumnWithText(
                                                      leftText: Strings.blockId,
                                                      rightText:
                                                          block.header.toString(), //TODO: verify block property to use
                                                      hasIcon: true,
                                                    )
                                                  : CustomRowWithText(
                                                      leftText: Strings.blockId,
                                                      rightText:
                                                          block.header.toString(), //TODO: verify block property to use
                                                      hasIcon: true,
                                                    ),
                                            ),
                                          ),
                                        ]),
                                        const CustomResponsiveRowColumn(children: [
                                          ResponsiveRowColumnItem(
                                            child: CustomPadding(child: CustomStatusWidget(status: "Confirmed")),
                                          ),
                                        ]),
                                        CustomResponsiveRowColumn(children: [
                                          ResponsiveRowColumnItem(
                                            child: CustomPadding(
                                              child: isMobile
                                                  ? CustomColumnWithText(
                                                      leftText: Strings.time,
                                                      rightText: block.timestamp.toString(),
                                                    )
                                                  : CustomRowWithText(
                                                      leftText: Strings.time,
                                                      rightText: block.timestamp.toString(),
                                                    ),
                                            ),
                                          ),
                                        ]),
                                        CustomResponsiveRowColumn(children: [
                                          ResponsiveRowColumnItem(
                                            child: CustomPadding(
                                              child: isMobile
                                                  ? CustomColumnWithText(
                                                      leftText: Strings.epoch,
                                                      rightText: block.epoch.toString(),
                                                    )
                                                  : CustomRowWithText(
                                                      leftText: Strings.epoch,
                                                      rightText: block.epoch.toString(),
                                                    ),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    )),
                                  ),
                                  SingleChildScrollView(
                                    child: CustomContainer(
                                        child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomResponsiveRowColumn(children: [
                                          ResponsiveRowColumnItem(
                                            child: CustomPadding(
                                              child: isMobile
                                                  ? CustomColumnWithText(
                                                      leftText: Strings.blockId,
                                                      rightText:
                                                          block.header.toString(), //TODO: verify block property to use
                                                      hasIcon: true,
                                                    )
                                                  : CustomRowWithText(
                                                      leftText: Strings.blockId,
                                                      rightText:
                                                          block.header.toString(), //TODO: verify block property to use
                                                      hasIcon: true,
                                                    ),
                                            ),
                                          ),
                                        ]),
                                        CustomResponsiveRowColumn(children: [
                                          ResponsiveRowColumnItem(
                                            child: CustomPadding(
                                              child: isMobile
                                                  ? CustomColumnWithText(
                                                      leftText: Strings.timeStamp,
                                                      rightText: block.timestamp.toString(),
                                                    )
                                                  : CustomRowWithText(
                                                      leftText: Strings.timeStamp,
                                                      rightText: block.timestamp.toString(),
                                                    ),
                                            ),
                                          ),
                                        ]),
                                        CustomResponsiveRowColumn(children: [
                                          ResponsiveRowColumnItem(
                                            child: CustomPadding(
                                              child: isMobile
                                                  ? CustomColumnWithText(
                                                      leftText: Strings.height,
                                                      rightText: block.height.toString(),
                                                    )
                                                  : CustomRowWithText(
                                                      leftText: Strings.height,
                                                      rightText: block.height.toString(),
                                                    ),
                                            ),
                                          ),
                                        ]),
                                        CustomResponsiveRowColumn(children: [
                                          ResponsiveRowColumnItem(
                                            child: CustomPadding(
                                              child: isMobile
                                                  ? CustomColumnWithText(
                                                      leftText: Strings.size,
                                                      rightText: block.size.toString(),
                                                    )
                                                  : CustomRowWithText(
                                                      leftText: Strings.size,
                                                      rightText: block.size.toString(),
                                                    ),
                                            ),
                                          ),
                                        ]),
                                        CustomResponsiveRowColumn(children: [
                                          ResponsiveRowColumnItem(
                                            child: CustomPadding(
                                              child: isMobile
                                                  ? CustomColumnWithText(
                                                      leftText: Strings.slot,
                                                      rightText: block.slot.toString(),
                                                    )
                                                  : CustomRowWithText(
                                                      leftText: Strings.slot,
                                                      rightText: block.slot.toString(),
                                                    ),
                                            ),
                                          ),
                                        ]),
                                        CustomResponsiveRowColumn(children: [
                                          ResponsiveRowColumnItem(
                                            child: CustomPadding(
                                              child: isMobile
                                                  ? CustomColumnWithText(
                                                      leftText: Strings.numberOfTransactions,
                                                      rightText: block.transactionNumber
                                                          .toString(), //TODO: verify block property to use
                                                    )
                                                  : CustomRowWithText(
                                                      leftText: Strings.numberOfTransactions,
                                                      rightText: block.transactionNumber
                                                          .toString(), //TODO: verify block property to use
                                                    ),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                      ),
                    ],
                  ),
                  footer:
                      Container(color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C), child: const Footer())),
              CustomLayout(
                  header: Header(
                    logoAsset: colorTheme == ThemeMode.light ? 'assets/icons/logo.svg' : 'assets/icons/logo_dark.svg',
                    onSearch: () {},
                    onDropdownChanged: (String value) {},
                  ),
                  content: Container(
                    height: MediaQuery.of(context).size.width == 1024 || MediaQuery.of(context).size.width == 768
                        ? MediaQuery.of(context).size.height - 300
                        : null,
                    decoration: BoxDecoration(
                      color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                    ),
                    child: Column(
                      children: [
                        CustomTabBar(colorTheme: colorTheme),
                        transactionsInfo.when(
                            data: (data) {
                              return PaginatedTransactionTable(
                                showAllColumns: false,
                                transactions: data,
                              );
                            },
                            loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                            error: (e, s) => Center(
                                  child: Text(e.toString()),
                                ))
                      ],
                    ),
                  ),
                  footer: Container(color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C), child: const Footer()))
            ],
          ),
        ),
      );
    }, error: (error, stackTrace) {
      return Text('Error occurred: $error');
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}
