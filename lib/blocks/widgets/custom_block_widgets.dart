import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:vrouter/vrouter.dart';

import '../../shared/theme.dart';

/// This is a custom widget that shows toggle buttons for the block details
class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.colorTheme,
  });

  final ThemeMode colorTheme;

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: isTablet ? 35 : 16),
          child: TextButton(
              onPressed: () {
                context.vRouter.to('/');
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back,
                      color:
                          getSelectedColor(colorTheme, 0xFF535757, 0xFFAFB6B6)),
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
        Padding(
          padding: EdgeInsets.only(left: isTablet ? 45.0 : 25.0, top: 20.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Block Details',
              style: titleLarge(context),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: SizedBox(
            child: TabBar(
              unselectedLabelColor:
                  getSelectedColor(colorTheme, 0xFF282A2C, 0xFF858E8E),
              labelColor: getSelectedColor(colorTheme, 0xFF282A2C, 0xFF434648),
              labelStyle: labelLarge(context),
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                color: getSelectedColor(colorTheme, 0xFFE7E8E8, 0xFFFEFEFE),
              ),
              padding:
                  EdgeInsets.only(right: isTablet ? 400.0 : 100.0, top: 20.0),
              tabs: [
                Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  child: const Tab(
                    child: Text('Summary'),
                  ),
                ),
                const SizedBox(
                  width: 200.0,
                  height: 40.0,
                  child: Tab(text: 'Transactions'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// This is a custom transaction table that is shown on the block details
class CustomPaginatedTable extends StatelessWidget {
  const CustomPaginatedTable({
    super.key,
    required this.source,
    required int rowsPerPage,
  }) : _rowsPerPage = rowsPerPage;

  final TableDataSource source;
  final int _rowsPerPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20.0, right: 0.0),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Theme(
              data: Theme.of(context).copyWith(),
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
                      padding: EdgeInsets.only(right: 60.0),
                      child: SizedBox(
                        child:
                            TableHeaderText(name: Strings.tableHeaderTxnHashId),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: EdgeInsets.only(right: 60.0),
                      child: TableHeaderText(name: Strings.tableHeaderBlock),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: EdgeInsets.only(right: 60.0),
                      child: TableHeaderText(name: Strings.tableHeaderType),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: EdgeInsets.only(right: 60.0),
                      child: TableHeaderText(name: Strings.tableHeaderFee),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

/// This is a custom data source for the transaction table
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
