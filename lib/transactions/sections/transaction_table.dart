import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/transactions/sections/transaction_row_item.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:vrouter/vrouter.dart';
import '../../shared/constants/strings.dart';
import '../../shared/providers/app_theme_provider.dart';
import '../../shared/utils/theme_color.dart';
import '../../shared/widgets/footer.dart';
import '../../shared/widgets/header.dart';
import '../../shared/widgets/layout.dart';
import '../models/transaction.dart';
import '../providers/transactions_provider.dart';

/// This is a custom widget that shows the transaction table screen
class TransactionTableScreen extends StatefulHookConsumerWidget {
  const TransactionTableScreen({Key? key}) : super(key: key);
  static const String route = '/transactions';
  @override
  _TransactionTableScreenState createState() => _TransactionTableScreenState();
}

class _TransactionTableScreenState extends ConsumerState<TransactionTableScreen> {
  bool viewAll = false;
  var _rowsPerPage = 5; //PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);
    final colorTheme = ref.watch(appThemeColorProvider);
    final AsyncValue<List<Transaction>> transactionsInfo = ref.watch(transactionsProvider);
    return transactionsInfo.when(
        data: (transactions) => CustomLayout(
              header: Header(
                logoAsset: colorTheme == ThemeMode.light ? 'images/logo.svg' : 'images/logo_dark.svg',
                onSearch: () {},
                onDropdownChanged: (String value) {},
              ),
              content: Container(
                color: colorTheme == ThemeMode.light ? const Color(0xFFFEFEFE) : const Color(0xFF282A2C),
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(left: isMobile ? 14 : 40.0, right: isMobile ? 0 : 40.0, bottom: 8.0),
                            child: SizedBox(
                              width: 100.0,
                              height: 50.0,
                              child: TextButton(
                                  onPressed: () {
                                    context.vRouter.to('/');
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_back,
                                        color: colorTheme == ThemeMode.light
                                            ? const Color(0xFF535757)
                                            : const Color(0xFFAFB6B6),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Back",
                                        style: bodyMedium(context),
                                      ),
                                    ],
                                  )),
                            )),
                        Container(
                            margin: EdgeInsets.only(
                                left: isMobile ? 16.0 : 40.0, right: isMobile ? 0 : 40.0, top: 8.0, bottom: 80.0),
                            child: SingleChildScrollView(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  cardColor: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                                ),
                                child: PaginatedDataTable(
                                  headingRowHeight: 50,
                                  columnSpacing: isTablet ? 34 : 40,
                                  arrowHeadColor: getSelectedColor(colorTheme, 0xFF282A2C, 0xFFFEFEFE),
                                  source: RowDataSource(
                                      transactions, context, getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C)),
                                  showFirstLastButtons: true,
                                  rowsPerPage: _rowsPerPage,
                                  dataRowHeight: 80,
                                  availableRowsPerPage: const [1, 5, 10, 50],
                                  onRowsPerPageChanged: (newRowsPerPage) {
                                    if (newRowsPerPage != null) {
                                      // setState(() {
                                      //   _rowsPerPage = newRowsPerPage;
                                      // });
                                    }
                                  },
                                  onPageChanged: (int? n) {
                                    /// value of n is the number of rows displayed so far
                                    setState(() {
                                      if (n != null) {
                                        final source = RowDataSource(transactions, context,
                                            getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C));

                                        /// Update rowsPerPage if the remaining count is less than the default rowsPerPage
                                        if (source.rowCount - n < _rowsPerPage) {
                                          _rowsPerPage = source.rowCount - n;
                                        } else {
                                          _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
                                        }
                                      } else {
                                        _rowsPerPage = 0;
                                      }
                                    });
                                  },
                                  columns: [
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
                                    DataColumn(
                                        label: Padding(
                                      padding: EdgeInsets.only(left: isTablet ? 2.0 : 40.0),
                                      child: const TableHeaderText(name: Strings.tableHeaderStatus),
                                    )),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
              footer: Container(color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C), child: const Footer()),
            ),
        error: (error, stack) => const Text('Oops, something unexpected happened'),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
