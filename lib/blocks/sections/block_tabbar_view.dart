import 'package:flutter/material.dart';
import 'package:flutter_annulus/blocks/models/block.dart';
import 'package:flutter_annulus/transactions/sections/transactions.dart';
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
  final _rowsPerPage = 5;
  final Block? block;

  // create a custom tab bar view

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final AsyncValue<List<Transaction>> transactionsInfo =
        ref.watch(transactionsProvider);

    return TabBarView(
      children: [
        Container(
          padding:
              isMobile ? const EdgeInsets.all(2.0) : const EdgeInsets.all(0),
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
                  const SizedBox(
                      width: 200, child: CustomTextLeft(desc: Strings.blockId)),
                  const SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(
                      desc:
                          block!.blockId.substring(0, Numbers.textLength - 3)),
                ],
              ),
              Row(
                children: [
                  const Spacing(),
                  const SizedBox(
                      width: 200,
                      child: Expanded(
                          child: CustomTextLeft(desc: Strings.status))),
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
                  SizedBox(
                      width: 200, child: CustomTextLeft(desc: Strings.time)),
                  SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: '12 sec ago')
                ],
              ),
              Row(
                children: [
                  const Spacing(),
                  const SizedBox(
                      width: 200, child: CustomTextLeft(desc: Strings.epoch)),
                  const SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: block!.epoch.toString())
                ],
              ),
              Row(
                children: [
                  const Spacing(),
                  const SizedBox(
                      width: 200, child: CustomTextLeft(desc: Strings.header)),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(child: CustomTextRight(desc: block!.header))
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
                  const SizedBox(
                      width: 200, child: CustomTextLeft(desc: Strings.id)),
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
                  const SizedBox(
                      width: 200,
                      child: CustomTextLeft(desc: Strings.timeStamp)),
                  const SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: block!.timestamp.toString())
                ],
              ),
              Row(
                children: [
                  const Spacing(),
                  const SizedBox(
                      width: 200, child: CustomTextLeft(desc: Strings.height)),
                  const SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: block!.height.toString())
                ],
              ),
              Row(
                children: [
                  const Spacing(),
                  const SizedBox(
                      width: 200, child: CustomTextLeft(desc: Strings.size)),
                  const SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: block!.size.toString())
                ],
              ),
              Row(
                children: [
                  const Spacing(),
                  const SizedBox(
                      width: 200, child: CustomTextLeft(desc: Strings.slot)),
                  const SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: block!.slot.toString())
                ],
              ),
              Row(
                children: [
                  const Spacing(),
                  const SizedBox(
                      width: 200,
                      child:
                          CustomTextLeft(desc: Strings.numberOfTransactions)),
                  const SizedBox(
                    width: 24,
                  ),
                  CustomTextRight(desc: block!.transactionNumber.toString())
                ],
              ),
            ],
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
            ),
            padding: const EdgeInsets.only(top: 40),
            child: transactionsInfo.when(
                data: (data) {
                  final source = TableDataSource(data, context,
                      getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C));
                  return SizedBox(
                    width: 100,
                    child: PaginatedDataTable(
                      source: source,
                      showFirstLastButtons: true,
                      rowsPerPage: _rowsPerPage,
                      dataRowHeight: 80,
                      columnSpacing: 0,
                      availableRowsPerPage: const [1, 5, 10, 50],
                      onRowsPerPageChanged: (newRowsPerPage) {
                        if (newRowsPerPage != null) {}
                      },
                      onPageChanged: (int? n) {},
                      columns: const [
                        DataColumn(
                          label: Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: SizedBox(
                              child: TableHeaderText(
                                  name: Strings.tableHeaderTxnHashId),
                            ),
                          ),
                        ),
                        DataColumn(
                            label: Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child:
                              TableHeaderText(name: Strings.tableHeaderBlock),
                        )),
                        DataColumn(
                            label: Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child: TableHeaderText(name: Strings.tableHeaderType),
                        )),
                        DataColumn(
                            label: Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child: TableHeaderText(name: Strings.tableHeaderFee),
                        )),
                      ],
                    ),
                  );
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

//TODO: Refactor this table source to reusable widget
class TableDataSource extends DataTableSource {
  TableDataSource(this.data, this.context, this.clr);

  BuildContext context;
  List<Transaction> data;
  Color clr;

  @override
  DataRow? getRow(int index) {
    final row = data[index];
    if (index < data.length) {
      return DataRow(
          color: MaterialStateProperty.all(clr),
          onLongPress: () {
            // Add what you want to do on tap
          },
          cells: <DataCell>[
            const DataCell(TransactionColumnText(
              textTop: 'row.',
              textBottom: "49 ${Strings.secAgo}",
            )),
            DataCell(TransactionColumnText(
              textTop: '${Strings.height}: ${row.block.height}',
              textBottom: '${Strings.slot}: ${row.block.slot}',
            )),
            DataCell(TransactionColumnText(
                textTop: '${row.amount} ${Strings.topl}',
                textBottom: '${row.quantity} ${Strings.bobs}')),
            DataCell(TransactionColumnText(
              textTop: '${row.transactionFee} ${Strings.feeAcronym}',
              textBottom: "",
              isBottomTextRequired: false,
            )),
          ]);
    } else {
      return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
