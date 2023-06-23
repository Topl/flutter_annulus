import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    required this.transactionId,
  }) : super(key: key);
  final String transactionId;

  static const String route = '/transactions_details/:transactionId';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    final transactionNotifier = ref.watch(transactionsProvider.notifier);
    final ValueNotifier<AsyncValue<Transaction>> asyncTransaction = useState(const AsyncLoading());

    Future<void> getTransaction() async {
      try {
        final Transaction transaction = await transactionNotifier.getSingleTransaction(transactionId: transactionId!);
        asyncTransaction.value = AsyncValue.data(transaction);
      } catch (e) {
        asyncTransaction.value = AsyncValue.error(e, StackTrace.current);
      }
    }

    useEffect(
      () {
        getTransaction();
        return null;
      },
      [],
    );

    return asyncTransaction.value.when(
      data: (transaction) {
        return CustomLayout(
            header: Header(
              logoAsset: colorTheme == ThemeMode.light ? 'images/logo.svg' : 'images/logo_dark.svg',
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
                                  Icon(Icons.arrow_back, color: getSelectedColor(colorTheme, 0xFF535757, 0xFFAFB6B6)),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Back",
                                    style: bodyMedium(context),
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
                                "Transaction Details",
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
                                      rowFlex: isMobile ? 3 : 2,
                                      child: CustomPadding(
                                          child: isMobile
                                              ? CustomColumnWithText(
                                                  leftText: 'Txn Hash/ID',
                                                  rightText: transaction.transactionId
                                                      .toString()
                                                      .substring(0, Numbers.textLength - 4),
                                                  hasIcon: true,
                                                )
                                              : CustomRowWithText(
                                                  leftText: 'Txn Hash/ID',
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
                                      rowFlex: 1,
                                      child: CustomPadding(
                                        child: CustomStatusWidget(status: transaction.status.name),
                                      )),
                                ],
                              ),
                              CustomResponsiveRowColumn(
                                children: [
                                  ResponsiveRowColumnItem(
                                      rowFlex: 1,
                                      child: CustomPadding(
                                          child: isMobile
                                              ? CustomColumnWithText(
                                                  leftText: 'Block', rightText: transaction.block.height.toString())
                                              : CustomRowWithText(
                                                  leftText: 'Block',
                                                  rightText: transaction.block.height.toString(),
                                                ))),
                                ],
                              ),
                              CustomResponsiveRowColumn(
                                children: [
                                  ResponsiveRowColumnItem(
                                      rowFlex: 1,
                                      child: CustomPadding(
                                          child: isMobile
                                              ? CustomColumnWithText(
                                                  leftText: 'Broadcast Timestamp',
                                                  rightText: transaction.broadcastTimestamp.toString(),
                                                )
                                              : CustomRowWithText(
                                                  leftText: 'Broadcast Timestamp',
                                                  rightText: transaction.broadcastTimestamp.toString(),
                                                ))),
                                ],
                              ),
                              CustomResponsiveRowColumn(
                                children: [
                                  ResponsiveRowColumnItem(
                                      rowFlex: 1,
                                      child: CustomPadding(
                                          child: isMobile
                                              ? CustomColumnWithText(
                                                  leftText: 'Confirmed Timestamp',
                                                  rightText: transaction.confirmedTimestamp.toString())
                                              : CustomRowWithText(
                                                  leftText: 'Confirmed Timestamp',
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
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? CustomColumnWithText(
                                              leftText: 'Type',
                                              rightText: transaction.transactionType.string.toString())
                                          : CustomRowWithText(
                                              leftText: 'Type',
                                              rightText: transaction.transactionType.string.toString(),
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? CustomColumnWithText(
                                              leftText: 'Amount', rightText: transaction.amount.toString())
                                          : CustomRowWithText(
                                              leftText: 'Amount',
                                              rightText: transaction.amount.toString(),
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? CustomColumnWithText(
                                              leftText: 'Txn Fee', rightText: transaction.transactionFee.toString())
                                          : CustomRowWithText(
                                              leftText: 'Txn Fee',
                                              rightText: transaction.transactionFee.toString(),
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? CustomColumnWithText(
                                              leftText: 'From',
                                              rightText: transaction.senderAddress
                                                  .toString()
                                                  .substring(0, Numbers.textLength - 3))
                                          : CustomRowWithText(
                                              leftText: 'From',
                                              rightText: transaction.senderAddress
                                                  .toString()
                                                  .substring(0, Numbers.textLength - 3),
                                            ))),
                            ],
                          ),
                          CustomResponsiveRowColumn(
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 1,
                                  child: CustomPadding(
                                      child: isMobile
                                          ? CustomColumnWithText(
                                              leftText: 'To',
                                              rightText: transaction.receiverAddress
                                                  .toString()
                                                  .substring(0, Numbers.textLength - 3))
                                          : CustomRowWithText(
                                              leftText: 'To',
                                              rightText: transaction.receiverAddress
                                                  .toString()
                                                  .substring(0, Numbers.textLength - 3),
                                            ))),
                            ],
                          ),
                        ])),
                        CustomContainer(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            CustomResponsiveRowColumn(
                              children: [
                                ResponsiveRowColumnItem(
                                    rowFlex: 1,
                                    child: CustomPadding(
                                        child: isMobile
                                            ? CustomColumnWithText(
                                                leftText: 'Size of Txn',
                                                rightText: transaction.transactionSize.toString())
                                            : CustomRowWithText(
                                                leftText: 'Size of Txn',
                                                rightText: transaction.transactionSize.toString(),
                                              ))),
                              ],
                            ),
                            CustomResponsiveRowColumn(
                              children: [
                                ResponsiveRowColumnItem(
                                    rowFlex: 1,
                                    child: CustomPadding(
                                        child: isMobile
                                            ? CustomColumnWithText(
                                                leftText: 'Proposition',
                                                rightText: transaction.proposition
                                                    .toString()
                                                    .substring(0, Numbers.textLength - 3))
                                            : CustomRowWithText(
                                                leftText: 'Proposition',
                                                rightText: transaction.proposition
                                                    .toString()
                                                    .substring(0, Numbers.textLength - 3),
                                              ))),
                              ],
                            ),
                            CustomResponsiveRowColumn(
                              children: [
                                ResponsiveRowColumnItem(
                                    rowFlex: 1,
                                    child: CustomPadding(
                                        child: isMobile
                                            ? CustomColumnWithText(
                                                leftText: 'Quantity', rightText: transaction.quantity.toString())
                                            : CustomRowWithText(
                                                leftText: 'Quantity',
                                                rightText: transaction.quantity.toString(),
                                              ))),
                              ],
                            ),
                            CustomResponsiveRowColumn(
                              children: [
                                ResponsiveRowColumnItem(
                                    rowFlex: 1,
                                    child: CustomPadding(
                                        child: isMobile
                                            ? CustomColumnWithText(
                                                leftText: 'Name', rightText: transaction.name.toString())
                                            : CustomRowWithText(
                                                leftText: 'Name',
                                                rightText: transaction.name.toString(),
                                              ))),
                              ],
                            )
                          ]),
                        ),
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
        return const CircularProgressIndicator();
      },
    );
  }
}
