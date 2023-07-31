import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/constants/ui.dart';
import 'package:flutter_annulus/shared/extensions/widget_extensions.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:flutter_annulus/transactions/models/transaction.dart';
import 'package:flutter_annulus/transactions/sections/transaction_details_drawer.dart';
import 'package:flutter_annulus/transactions/sections/transaction_details_page.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:vrouter/vrouter.dart';

class PaginatedTransactionTable extends HookConsumerScreenWidget {
  final List<Transaction> transactions;
  final bool showAllColumns;
  final bool isTabView;
  const PaginatedTransactionTable({
    required this.transactions,
    required this.showAllColumns,
    this.isTabView = false,
    Key? key,
  }) : super(key: key);
  static const availableRowsPerPage = <int>[5, 10, 15, 20];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBiggerTablet = MediaQuery.of(context).size.width == 1024;
    final isBiggerScreen = MediaQuery.of(context).size.width == 1920;
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    final colorTheme = ref.watch(appThemeColorProvider);

    final rowsPerPage = useState(availableRowsPerPage[0]);

    final double columnSpacing = isBiggerTablet
        ? 70
        : isTablet
            ? 24
            : isBiggerScreen
                ? 133
                : isMobile
                    ? 0
                    : 35;
    return PaginatedDataTable(
      showCheckboxColumn: false,
      headingRowHeight: 50,
      columnSpacing: columnSpacing,
      arrowHeadColor: getSelectedColor(colorTheme, 0xFF282A2C, 0xFFFEFEFE),
      source: RowDataSource(
        data: transactions,
        context: context,
        clr: getSelectedColor(
          colorTheme,
          0xFFFEFEFE,
          0xFF282A2C,
        ),
        showAllColumns: showAllColumns,
      ),
      showFirstLastButtons: true,
      rowsPerPage: rowsPerPage.value,
      dataRowMaxHeight: 80,
      dataRowMinHeight: 80,
      availableRowsPerPage: availableRowsPerPage,
      onRowsPerPageChanged: (int? newRowsPerPage) {
        if (newRowsPerPage != null) {
          rowsPerPage.value = newRowsPerPage;
        }
      },
      columns: _dataColumns(
        showAllColumns: showAllColumns,
        isTablet: isTablet,
        isTabView: isTabView,
      ),
    );
  }
}

List<DataColumn> _dataColumns({
  required bool showAllColumns,
  required bool isTablet,
  required bool isTabView,
}) {
  if (showAllColumns) {
    return [
      DataColumn(
        label: Padding(
          padding: EdgeInsets.only(left: isTablet ? 2.0 : 40.0),
          child: const SizedBox(
            child: TableHeaderText(name: Strings.tableHeaderTxnHashId),
          ),
        ),
      ),
      DataColumn(
          label: Padding(
        padding: EdgeInsets.only(left: isTablet ? 2.0 : 40.0),
        child: const TableHeaderText(name: Strings.tableHeaderBlock),
      )),
      DataColumn(
          label: Padding(
        padding: EdgeInsets.only(left: isTablet ? 2.0 : 40.0),
        child: const TableHeaderText(name: Strings.tableHeaderType),
      )),
      DataColumn(
          label: Padding(
        padding: EdgeInsets.only(left: isTablet ? 2.0 : 40.0),
        child: const TableHeaderText(name: Strings.tableHeaderSummary),
      )),
      DataColumn(
          label: Padding(
        padding: EdgeInsets.only(left: isTablet ? 2.0 : 40.0),
        child: const TableHeaderText(name: Strings.tableHeaderFee),
      )),
      const DataColumn(
        label: Padding(
          padding: EdgeInsets.only(left: 2.0),
          child: TableHeaderText(name: Strings.tableHeaderStatus),
        ),
      ),
    ];
  } else {
    EdgeInsets padding = isTabView ? const EdgeInsets.only(left: 40.0) : const EdgeInsets.only(right: 60.0);
    return [
      DataColumn(
        label: Padding(
          padding: padding,
          child: const SizedBox(
            child: TableHeaderText(name: Strings.tableHeaderTxnHashId),
          ),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: padding,
          child: const TableHeaderText(name: Strings.tableHeaderBlock),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: padding,
          child: const TableHeaderText(name: Strings.tableHeaderType),
        ),
      ),
      DataColumn(
        label: Padding(
          padding: padding,
          child: const TableHeaderText(name: Strings.tableHeaderFee),
        ),
      ),
    ];
  }
}

/// Data source class for obtaining row data for PaginatedDataTable.
class RowDataSource extends DataTableSource {
  final BuildContext context;
  final List<Transaction> data;
  final Color clr;
  final bool showAllColumns;
  RowDataSource({
    required this.data,
    required this.context,
    required this.showAllColumns,
    required this.clr,
  });

  @override
  DataRow? getRow(int index) {
    final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

    final row = data[index];
    if (index < data.length) {
      return DataRow(
        color: MaterialStateProperty.all(clr),
        onSelectChanged: (value) {
          print('QQQQ here 0');
          if (isDesktop) {
            showModalSideSheet(
              context: context,
              ignoreAppBar: true,
              width: 640,
              barrierColor: Colors.white.withOpacity(barrierOpacity),
              // with blur,
              barrierDismissible: true,
              body: TransactionDetailsDrawer(
                transaction: row,
              ),
            );
          } else {
            print('QQQQ here 1');
            context.vRouter.to(TransactionDetailsPage.transactionDetailsPath(row.transactionId));
          }
        },
        cells: showAllColumns
            ? <DataCell>[
                DataCell(GestureDetector(
                  child: TransactionColumnText(
                    isTransactionTable: true,
                    textTop: isTablet ? row.transactionId.substring(0, 9) : row.transactionId.substring(0, 38),
                    textBottom: "49 ${Strings.secAgo}",
                  ),
                )),
                DataCell(TransactionColumnText(
                  isTransactionTable: true,
                  textTop: '${Strings.height}: ${row.block.height}',
                  textBottom: '${Strings.slot}: ${row.block.slot}',
                )),
                DataCell(TransactionColumnText(
                  isTransactionTable: true,
                  textTop: row.transactionType.string,
                  textBottom: "",
                  isBottomTextRequired: false,
                )),
                const DataCell(TransactionColumnText(
                    isTransactionTable: true, textTop: '3 ${Strings.topl}', textBottom: '44 ${Strings.bobs}')),
                DataCell(TransactionColumnText(
                  isTransactionTable: true,
                  textTop: '${row.transactionFee} ${Strings.feeAcronym}',
                  textBottom: "",
                  isBottomTextRequired: false,
                )),
                DataCell(StatusButton(isTransactionTable: true, status: row.status.string)),
              ]
            : <DataCell>[
                const DataCell(TransactionColumnText(
                  textTop: 'row.',
                  textBottom: "49 ${Strings.secAgo}",
                )),
                DataCell(TransactionColumnText(
                  textTop: '${Strings.height}: ${row.block.height}',
                  textBottom: '${Strings.slot}: ${row.block.slot}',
                )),
                DataCell(TransactionColumnText(
                    textTop: '${row.amount} ${Strings.topl}', textBottom: '${row.quantity} ${Strings.bobs}')),
                DataCell(TransactionColumnText(
                  textTop: '${row.transactionFee} ${Strings.feeAcronym}',
                  textBottom: "",
                  isBottomTextRequired: false,
                )),
              ],
      );
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
