import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/theme.dart';
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
import '../models/transaction.dart';
import '../providers/transactions_provider.dart';
import '../../shared/constants/numbers.dart';

/// This is a custom widget that shows the transaction details page
class TransactionDetailsPage extends HookConsumerWidget {
  const TransactionDetailsPage({
    Key? key,
  }) : super(key: key);

  static const String transactionIdParam = 'transactionId';
  static const String route = '/transactions_details/';
  static const String paramRoute = '$route:$transactionIdParam';
  static String transactionDetailsPath(String transactionId) {
    return '$route$transactionId';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? transactionId = context.vRouter.pathParameters[transactionIdParam];
    print('QQQQ pathParameters: ${context.vRouter.pathParameters}');
    print('QQQQ paramRoute: $paramRoute');
    print('QQQQ transactionId: $transactionId');

    if (transactionId == null) {
      context.vRouter.to('/');
    }

    print('QQQQ build 1');
    final colorTheme = ref.watch(appThemeColorProvider);
    print('QQQQ build 2');
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    print('QQQQ build 3');
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);
    print('QQQQ build 4');

    final AsyncValue<Transaction> asyncTransaction = ref.watch(getTransactionByIdProvider(transactionId!));
    print('QQQQ build 5');

    return asyncTransaction.when(
      data: (transaction) {
        print('QQQQ transaction: $transaction');
        return CustomLayout(
            header: Header(
              logoAsset: colorTheme == ThemeMode.light ? 'assets/icons/logo.svg' : 'assets/icons/logo_dark.svg',
              onSearch: () {},
              onDropdownChanged: (String value) {},
            ),
            content: DefaultTabController(
                length: 3,
                child: SingleChildScrollView(
                  child: Container(
                    height: isTablet ? MediaQuery.of(context).size.height - 280 : null,
                    decoration: BoxDecoration(
                      color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: isMobile ? 6 : 30),
                          child: TextButton(
                              onPressed: () {
                                if (context.vRouter.previousUrl != null) {
                                  context.vRouter.to(context.vRouter.previousUrl!);
                                } else {
                                  context.vRouter.to('/');
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back, color: getSelectedColor(colorTheme, 0xFF535757, 0xFFAFB6B6)),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    Strings.backText,
                                    style: bodyMedium(context),
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: isMobile ? 16 : 40),
                          child: Row(
                            children: [
                              Text(
                                Strings.transactionDetailsHeader,
                                style: headlineLarge(context),
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
                                      child: CustomPadding(
                                          child: isMobile
                                              ? CustomColumnWithText(
                                                  leftText: Strings.tableHeaderTxnHashId,
                                                  rightText: transaction.transactionId
                                                      .toString()
                                                      .substring(0, Numbers.textLength - 3),
                                                  hasIcon: true,
                                                )
                                              : CustomRowWithText(
                                                  leftText: Strings.tableHeaderTxnHashId,
                                                  rightText: transaction.transactionId
                                                      .toString()
                                                      .substring(0, Numbers.textLength - 3),
                                                  hasIcon: true,
                                                ))),
                                ],
                              ),
                              CustomResponsiveRowColumn(
                                children: [
                                  ResponsiveRowColumnItem(
                                      child: CustomPadding(
                                    child: CustomStatusWidget(status: transaction.status.name),
                                  )),
                                ],
                              ),
                              CustomResponsiveRowColumn(
                                children: [
                                  ResponsiveRowColumnItem(
                                      child: CustomPadding(
                                          child: isMobile
                                              ? CustomColumnWithText(
                                                  leftText: Strings.block,
                                                  rightText: transaction.block.height.toString())
                                              : CustomRowWithText(
                                                  leftText: Strings.block,
                                                  rightText: transaction.block.height.toString(),
                                                ))),
                                ],
                              ),
                              CustomResponsiveRowColumn(
                                children: [
                                  ResponsiveRowColumnItem(
                                      child: CustomPadding(
                                          child: isMobile
                                              ? CustomColumnWithText(
                                                  leftText: Strings.broadcastTimestamp,
                                                  rightText: transaction.broadcastTimestamp.toString(),
                                                )
                                              : CustomRowWithText(
                                                  leftText: Strings.broadcastTimestamp,
                                                  rightText: transaction.broadcastTimestamp.toString(),
                                                ))),
                                ],
                              ),
                              CustomResponsiveRowColumn(
                                children: [
                                  ResponsiveRowColumnItem(
                                      child: CustomPadding(
                                          child: isMobile
                                              ? CustomColumnWithText(
                                                  leftText: Strings.confirmedTimestamp,
                                                  rightText: transaction.confirmedTimestamp.toString())
                                              : CustomRowWithText(
                                                  leftText: Strings.confirmedTimestamp,
                                                  rightText: transaction.confirmedTimestamp.toString(),
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
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  child: CustomPadding(
                                      child: isMobile
                                          ? CustomColumnWithText(
                                              leftText: Strings.type,
                                              rightText: transaction.transactionType.string.toString())
                                          : CustomRowWithText(
                                              leftText: Strings.type,
                                              rightText: transaction.transactionType.string.toString(),
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  child: CustomPadding(
                                      child: isMobile
                                          ? CustomColumnWithText(
                                              leftText: Strings.amount, rightText: transaction.amount.toString())
                                          : CustomRowWithText(
                                              leftText: Strings.amount,
                                              rightText: transaction.amount.toString(),
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  child: CustomPadding(
                                      child: isMobile
                                          ? CustomColumnWithText(
                                              leftText: Strings.txnFee,
                                              rightText: transaction.transactionFee.toString())
                                          : CustomRowWithText(
                                              leftText: Strings.txnFee,
                                              rightText: transaction.transactionFee.toString(),
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  child: CustomPadding(
                                      child: isMobile
                                          ? CustomColumnWithText(
                                              leftText: Strings.fromAddress,
                                              rightText: transaction.senderAddress[0]
                                                  .toString()
                                                  .substring(0, Numbers.textLength - 3))
                                          : CustomRowWithText(
                                              leftText: Strings.fromAddress,
                                              rightText: transaction.senderAddress[0]
                                                  .toString()
                                                  .substring(0, Numbers.textLength - 3),
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  child: CustomPadding(
                                      child: isMobile
                                          ? CustomColumnWithText(
                                              leftText: Strings.toAddress,
                                              rightText: transaction.receiverAddress[0]
                                                  .toString()
                                                  .substring(0, Numbers.textLength - 3),
                                            )
                                          : CustomRowWithText(
                                              leftText: Strings.toAddress,
                                              rightText: transaction.receiverAddress[0]
                                                  .toString()
                                                  .substring(0, Numbers.textLength - 3),
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  child: CustomPadding(
                                      child: isMobile
                                          ? CustomColumnWithText(
                                              leftText: Strings.transactionSize,
                                              rightText: transaction.transactionSize.toString())
                                          : CustomRowWithText(
                                              leftText: Strings.transactionSize,
                                              rightText: transaction.transactionSize.toString(),
                                            ))),
                            ],
                          ),
                        ])),
                      ],
                    ),
                  ),
                )),
            footer: Container(color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C), child: const Footer()));
      },
      error: (error, stackTrace) {
        return Text('Error occurred: $error');
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
