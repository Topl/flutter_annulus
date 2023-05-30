import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:vrouter/vrouter.dart';

import '../../shared/providers/app_theme_provider.dart';
import '../../shared/widgets/footer.dart';
import '../../shared/widgets/header.dart';
import '../../shared/widgets/layout.dart';


class TransactionDetailsPage extends HookConsumerWidget {
  final String transactionId;
  const TransactionDetailsPage({
    Key? key,
    required this.transactionId,
  }) : super(key: key);
  static const String route = '/transactions_details/:transactionId';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    /// Make a function with logic to fetch transactions
    /// where each item has an id that matches the transactionId

    return CustomLayout(
        header: Header(
          logoAsset: colorTheme == ColorMode.light
              ? 'images/logo.svg'
              : 'images/logo_dark.svg',
          onSearch: () {},
          onDropdownChanged: (String value) {},
        ),
        content: DefaultTabController(
            length: 3,
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: TextButton(
                          onPressed: () {
                            context.vRouter.to('/transactions');
                          },
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back,
                                  color: getSelectedColor(
                                      colorTheme, 0xFF535757, 0xFFAFB6B6)),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Back",
                                style: TextStyle(
                                  color: getSelectedColor(
                                      colorTheme, 0xFF535757, 0xFFAFB6B6),
                                  fontFamily: 'Rational Display',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          Text(
                            "Transaction Details",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Rational Display',
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: isMobile ? 3 : 2,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? const CustomColumnWithText(
                                              leftText: 'Txn Hash/ID',
                                              rightText:
                                                  '0x5be9d701Byd24neQfY1vXa987a',
                                              hasIcon: true,
                                            )
                                          : const CustomRowWithText(
                                              leftText: 'Txn Hash/ID',
                                              rightText:
                                                  '0x5be9d701Byd24neQfY1vXa987a',
                                              hasIcon: true,
                                            ))),
                            ],
                          ),
                          const CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                    child: CustomStatusWidget(),
                                  )),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? const CustomColumnWithText(
                                              leftText: 'Block',
                                              rightText: '242218')
                                          : const CustomRowWithText(
                                              leftText: 'Block',
                                              rightText: '242218',
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? const CustomColumnWithText(
                                              leftText: 'Broadcast Timestamp',
                                              rightText: 'UTC 16:32:01',
                                            )
                                          : const CustomRowWithText(
                                              leftText: 'Broadcast Timestamp',
                                              rightText: 'UTC 16:32:01',
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? const CustomColumnWithText(
                                              leftText: 'Confirmed Timestamp',
                                              rightText: 'UTC 16:34:51')
                                          : const CustomRowWithText(
                                              leftText: 'Confirmed Timestamp',
                                              rightText: 'UTC 16:34:51',
                                            ))),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomContainer(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? const CustomColumnWithText(
                                              leftText: 'Type',
                                              rightText: 'Transfer')
                                          : const CustomRowWithText(
                                              leftText: 'Type',
                                              rightText: 'Transfer',
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? const CustomColumnWithText(
                                              leftText: 'Amount',
                                              rightText: '6,215.232 TOPL')
                                          : const CustomRowWithText(
                                              leftText: 'Amount',
                                              rightText: '6,215.232 TOPL',
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? const CustomColumnWithText(
                                              leftText: 'Txn Fee',
                                              rightText: '2.1 LVL')
                                          : const CustomRowWithText(
                                              leftText: 'Txn Fee',
                                              rightText: '2.1 LVL',
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? const CustomColumnWithText(
                                              leftText: 'From',
                                              rightText:
                                                  '3m21ucZ0pFyvxa1by9dnE2q87e3P6ic')
                                          : const CustomRowWithText(
                                              leftText: 'From',
                                              rightText:
                                                  '3m21ucZ0pFyvxa1by9dnE2q87e3P6ic',
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? const CustomColumnWithText(
                                              leftText: 'To',
                                              rightText:
                                                  '7bY6Dne54qMU12cz3oPF4yVx5aG6a')
                                          : const CustomRowWithText(
                                              leftText: 'To',
                                              rightText:
                                                  '7bY6Dne54qMU12cz3oPF4yVx5aG6a',
                                            ))),
                            ],
                          ),
                        ])),
                    CustomContainer(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomResponsiveRowColumn(
                              children: [
                                ResponsiveRowColumnItem(
                                    rowFlex: 1,
                                    child: CustomPadding(
                                        child: isMobile
                                            ? const CustomColumnWithText(
                                                leftText: 'Size of Txn',
                                                rightText: '17321')
                                            : const CustomRowWithText(
                                                leftText: 'Size of Txn',
                                                rightText: '17321',
                                              ))),
                              ],
                            ),
                            CustomResponsiveRowColumn(
                              children: [
                                ResponsiveRowColumnItem(
                                    rowFlex: 1,
                                    child: CustomPadding(
                                        child: isMobile
                                            ? const CustomColumnWithText(
                                                leftText: 'Proposition',
                                                rightText: '0x736e345d784cf4c')
                                            : const CustomRowWithText(
                                                leftText: 'Proposition',
                                                rightText: '0x736e345d784cf4c',
                                              ))),
                              ],
                            ),
                            CustomResponsiveRowColumn(
                              children: [
                                ResponsiveRowColumnItem(
                                    rowFlex: 1,
                                    child: CustomPadding(
                                        child: isMobile
                                            ? const CustomColumnWithText(
                                                leftText: 'Quantity',
                                                rightText: '413113 / 64.31')
                                            : const CustomRowWithText(
                                                leftText: 'Quantity',
                                                rightText: '413113 / 64.31',
                                              ))),
                              ],
                            ),
                            CustomResponsiveRowColumn(
                              children: [
                                ResponsiveRowColumnItem(
                                    rowFlex: 1,
                                    child: CustomPadding(
                                        child: isMobile
                                            ? const CustomColumnWithText(
                                                leftText: 'Name',
                                                rightText: 'Topl / Allie')
                                            : const CustomRowWithText(
                                                leftText: 'Name',
                                                rightText: 'Topl / Allie',
                                              ))),
                              ],
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            )),
        footer: Container(
            color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
            child: const Footer()));
  }
}
