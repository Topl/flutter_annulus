import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/providers/transactions_provider.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:vrouter/vrouter.dart';

import '../../shared/providers/app_theme_provider.dart';
import '../../shared/widgets/footer.dart';
import '../../shared/widgets/header.dart';
import '../../shared/widgets/layout.dart';

class UTxODetailsPage extends HookConsumerWidget {
  const UTxODetailsPage({
    Key? key,
    // required this.utxoId,
  }) : super(key: key);
  static const String route = '/utxo_details';
  // final String utxoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    final AsyncValue<List<Transaction>> transactionsInfo =
        ref.watch(transactionsProvider);

    final transaction = transactionsInfo.when(
      data: (transactions) {
        //
      },
      loading: () => null,
      error: (_, __) => null,
    );

    const int textLength = 30;

    return CustomLayout(
        header: Header(
          logoAsset: colorTheme == ThemeMode.light
              ? 'images/logo.svg'
              : 'images/logo_dark.svg',
          onSearch: () {},
          onDropdownChanged: (String value) {},
        ),
        content: DefaultTabController(
            length: 3,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: TextButton(
                          onPressed: () {
                            context.vRouter.to('/');
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
                                'Back',
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
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          Text(
                            'UTxO Details',
                            style: TextStyle(
                              color: getSelectedColor(
                                  colorTheme, 0xFF282A2C, 0xFFFEFEFE),
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
                                    child:
                                        CustomStatusWidget(status: 'Confirmed'),
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
                                              leftText: 'Sender Address',
                                              rightText:
                                                  '3m21ucZ0pFyvxa1by9dnE2q87e3P6ic')
                                          : const CustomRowWithText(
                                              leftText: 'Sender Address',
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
                                              leftText: 'Receiver Address',
                                              rightText:
                                                  '7bY6Dne54qMU12cz3oPF4yVx5aG6a',
                                            )
                                          : const CustomRowWithText(
                                              leftText: 'Receiver Address',
                                              rightText:
                                                  '7bY6Dne54qMU12cz3oPF4yVx5aG6a',
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
                                              leftText: 'Change back address',
                                              rightText:
                                                  '3m21ucZ0pFyvxa1by9dnE2q87e3P6ic')
                                          : const CustomRowWithText(
                                              leftText: 'Change back address',
                                              rightText:
                                                  '3m21ucZ0pFyvxa1by9dnE2q87e3P6ic',
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
                                              leftText: 'Input amount',
                                              rightText: '5.5 TOPL')
                                          : const CustomRowWithText(
                                              leftText: 'Input amount',
                                              rightText: '5.5 TOPL',
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
                                              leftText: 'Input amount',
                                              rightText: '5.5 TOPL')
                                          : const CustomRowWithText(
                                              leftText: 'Input amount',
                                              rightText: '1.23 TOPL',
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
                                                leftText: 'Output amount',
                                                rightText: '6 TOPL')
                                            : const CustomRowWithText(
                                                leftText: 'Output amount',
                                                rightText: '6 TOPL',
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
                                                leftText: 'Output amount',
                                                rightText: '0.63 TOPL')
                                            : const CustomRowWithText(
                                                leftText: 'Output amount',
                                                rightText: '0.63 TOPL',
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
                                                leftText: 'Fee amount',
                                                rightText: '0.1 TOPL')
                                            : const CustomRowWithText(
                                                leftText: 'Fee amount',
                                                rightText: '0.1 TOPL',
                                              ))),
                              ],
                            ),
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
