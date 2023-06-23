import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/widgets/custom_block_widgets.dart';
import 'package:flutter_annulus/shared/widgets/footer.dart';
import 'package:flutter_annulus/shared/widgets/header.dart';
import 'package:flutter_annulus/shared/widgets/layout.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';

import '../../shared/providers/app_theme_provider.dart';
import '../../shared/utils/theme_color.dart';
import '../../transactions/models/transaction.dart';
import '../../transactions/providers/transactions_provider.dart';
import '../../transactions/widgets/custom_transaction_widgets.dart';

// This is the block_details widget that is shown when the user clicks on the block on mobile
class BlockTabBarMobileView extends HookConsumerWidget {
  const BlockTabBarMobileView({
    super.key,
    // required this.block,
     this.widgetRoute,
  });
  final _rowsPerPage = 5;
  //final Block block;
  final String? widgetRoute;

  // create a custom tab bar view
  static const String route = '/block_details';
  // assign widgetRoute to route
  static String getRoute(String widgetRoute) => route;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final AsyncValue<List<Transaction>> transactionsInfo =
        ref.watch(transactionsProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [
            CustomLayout(
                header: Header(
                  logoAsset: colorTheme == ThemeMode.light
                      ? 'images/logo.svg'
                      : 'images/logo_dark.svg',
                  onSearch: () {},
                  onDropdownChanged: (String value) {},
                ),
                content: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
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
                                        rowFlex: isMobile ? 3 : 2,
                                        child: CustomPadding(
                                          child: isMobile
                                              ? const CustomColumnWithText(
                                                  leftText: 'Block ID',
                                                  rightText: "242218",
                                                  hasIcon: true,
                                                )
                                              : const CustomRowWithText(
                                                  leftText: 'Block ID',
                                                  rightText: "242218",
                                                  hasIcon: true,
                                                ),
                                        ),
                                      ),
                                    ]),
                                    CustomResponsiveRowColumn(children: [
                                      ResponsiveRowColumnItem(
                                        rowFlex: isMobile ? 3 : 2,
                                        child: const CustomPadding(
                                            child: CustomStatusWidget(
                                                status: "Confirmed")),
                                      ),
                                    ]),
                                    CustomResponsiveRowColumn(children: [
                                      ResponsiveRowColumnItem(
                                        rowFlex: isMobile ? 3 : 2,
                                        child: CustomPadding(
                                          child: isMobile
                                              ? const CustomColumnWithText(
                                                  leftText: 'Time',
                                                  rightText: "12 sec ago",
                                                )
                                              : const CustomRowWithText(
                                                  leftText: 'Time',
                                                  rightText: "12 sec ago",
                                                ),
                                        ),
                                      ),
                                    ]),
                                    CustomResponsiveRowColumn(children: [
                                      ResponsiveRowColumnItem(
                                        rowFlex: isMobile ? 3 : 2,
                                        child: CustomPadding(
                                          child: isMobile
                                              ? const CustomColumnWithText(
                                                  leftText: 'Epoch',
                                                  rightText: "EP100",
                                                )
                                              : const CustomRowWithText(
                                                  leftText: 'Epoch',
                                                  rightText: "EP100",
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
                                        rowFlex: isMobile ? 3 : 2,
                                        child: CustomPadding(
                                          child: isMobile
                                              ? const CustomColumnWithText(
                                                  leftText: 'ID',
                                                  rightText:
                                                      "0x736e345d784cf4c9",
                                                  hasIcon: true,
                                                )
                                              : const CustomRowWithText(
                                                  leftText: 'ID',
                                                  rightText:
                                                      "0x736e345d784cf4c9",
                                                  hasIcon: true,
                                                ),
                                        ),
                                      ),
                                    ]),
                                    CustomResponsiveRowColumn(children: [
                                      ResponsiveRowColumnItem(
                                        rowFlex: isMobile ? 3 : 2,
                                        child: CustomPadding(
                                          child: isMobile
                                              ? const CustomColumnWithText(
                                                  leftText: 'Timestamp',
                                                  rightText: "UTC 16:32:01",
                                                )
                                              : const CustomRowWithText(
                                                  leftText: 'Timestamp',
                                                  rightText: "UTC 16:32:01",
                                                ),
                                        ),
                                      ),
                                    ]),
                                    CustomResponsiveRowColumn(children: [
                                      ResponsiveRowColumnItem(
                                        rowFlex: isMobile ? 3 : 2,
                                        child: CustomPadding(
                                          child: isMobile
                                              ? const CustomColumnWithText(
                                                  leftText: 'Height',
                                                  rightText: "17321",
                                                )
                                              : const CustomRowWithText(
                                                  leftText: 'Height',
                                                  rightText: "17321",
                                                ),
                                        ),
                                      ),
                                    ]),
                                    CustomResponsiveRowColumn(children: [
                                      ResponsiveRowColumnItem(
                                        rowFlex: isMobile ? 3 : 2,
                                        child: CustomPadding(
                                          child: isMobile
                                              ? const CustomColumnWithText(
                                                  leftText: 'Size',
                                                  rightText: "h1000",
                                                )
                                              : const CustomRowWithText(
                                                  leftText: 'Size',
                                                  rightText: "h1000",
                                                ),
                                        ),
                                      ),
                                    ]),
                                    CustomResponsiveRowColumn(children: [
                                      ResponsiveRowColumnItem(
                                        rowFlex: isMobile ? 3 : 2,
                                        child: CustomPadding(
                                          child: isMobile
                                              ? const CustomColumnWithText(
                                                  leftText: 'Slot',
                                                  rightText: "12556",
                                                )
                                              : const CustomRowWithText(
                                                  leftText: 'Slot',
                                                  rightText: "12556",
                                                ),
                                        ),
                                      ),
                                    ]),
                                    CustomResponsiveRowColumn(children: [
                                      ResponsiveRowColumnItem(
                                        rowFlex: isMobile ? 3 : 2,
                                        child: CustomPadding(
                                          child: isMobile
                                              ? const CustomColumnWithText(
                                                  leftText:
                                                      'Number of Transactions',
                                                  rightText: "131",
                                                )
                                              : const CustomRowWithText(
                                                  leftText:
                                                      'Number of Transactions',
                                                  rightText: "131",
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
                      )),
                    ),
                  ],
                ),
                footer: Container(
                    color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                    child: const Footer())),
            CustomLayout(
                header: Header(
                  logoAsset: colorTheme == ThemeMode.light
                      ? 'images/logo.svg'
                      : 'images/logo_dark.svg',
                  onSearch: () {},
                  onDropdownChanged: (String value) {},
                ),
                content: Container(
                  decoration: BoxDecoration(
                    color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                  ),
                  child: Column(
                    children: [
                      CustomTabBar(colorTheme: colorTheme),
                      transactionsInfo.when(
                          data: (data) {
                            final source = TableDataSource(
                                data,
                                context,
                                getSelectedColor(
                                    colorTheme, 0xFFFEFEFE, 0xFF282A2C));
                            return CustomPaginatedTable(
                                source: source, rowsPerPage: _rowsPerPage);
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
                footer: Container(
                    color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                    child: const Footer()))
          ],
        ),
      ),
    );
  }
}