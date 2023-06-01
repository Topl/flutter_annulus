import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/sections/transaction_row_item.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';
import '../../shared/constants/strings.dart';
import '../../shared/providers/app_theme_provider.dart';
import '../../shared/utils/theme_color.dart';
import '../../shared/widgets/footer.dart';
import '../../shared/widgets/header.dart';
import '../../shared/widgets/layout.dart';
import '../models/transaction.dart';
import '../providers/transactions_provider.dart';

class TransactionTableScreen extends StatefulHookConsumerWidget {
  TransactionTableScreen({Key? key}) : super(key: key);
  static const String route = '/transactions';
  @override
  _TransactionTableScreenState createState() => _TransactionTableScreenState();
}

class _TransactionTableScreenState
    extends ConsumerState<TransactionTableScreen> {
  bool viewAll = false;
  var _rowsPerPage = 5; //PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final AsyncValue<List<Transaction>> transactionsInfo =
        ref.watch(transactionsProvider);
    return transactionsInfo.when(
        data: (transactions) => CustomLayout(
              header: Header(
                logoAsset: colorTheme == ColorMode.light
                    ? 'images/logo.svg'
                    : 'images/logo_dark.svg',
                onSearch: () {},
                onDropdownChanged: (String value) {},
              ),
              content: Container(
                color: colorTheme == ColorMode.light
                    ? const Color(0xFFFEFEFE)
                    : const Color(0xFF282A2C),
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0,
                                right: 40.0,
                                top: 40.0,
                                bottom: 8.0),
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
                                        color: colorTheme == ColorMode.light
                                            ? const Color(0xFF535757)
                                            : const Color(0xFFAFB6B6),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Back",
                                        style: TextStyle(
                                          color: colorTheme == ColorMode.light
                                              ? const Color(0xFF535757)
                                              : const Color(0xFFAFB6B6),
                                          fontFamily: 'Rational Display',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )),
                            )),
                        Container(
                            margin: const EdgeInsets.only(
                                left: 40.0,
                                right: 40.0,
                                top: 8.0,
                                bottom: 80.0),
                            child: SingleChildScrollView(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  cardColor: getSelectedColor(
                                      colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                                ),
                                child: PaginatedDataTable(
                                  arrowHeadColor: getSelectedColor(
                                      colorTheme, 0xFF282A2C, 0xFFFEFEFE),
                                  source: RowDataSource(
                                      transactions,
                                      context,
                                      getSelectedColor(
                                          colorTheme, 0xFFFEFEFE, 0xFF282A2C)),
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
                                        final source = RowDataSource(
                                            transactions,
                                            context,
                                            getSelectedColor(colorTheme,
                                                0xFFFEFEFE, 0xFF282A2C));

                                        /// Update rowsPerPage if the remaining count is less than the default rowsPerPage
                                        if (source.rowCount - n <
                                            _rowsPerPage) {
                                          _rowsPerPage = source.rowCount - n;
                                        } else {
                                          _rowsPerPage = PaginatedDataTable
                                              .defaultRowsPerPage;
                                        }
                                      } else {
                                        _rowsPerPage = 0;
                                      }
                                    });
                                  },
                                  columns: const [
                                    DataColumn(
                                      label: Padding(
                                        padding: EdgeInsets.only(left: 40.0),
                                        child: SizedBox(
                                          child: TableHeaderText(
                                              name:
                                                  Strings.tableHeaderTxnHashId),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                        label: Padding(
                                      padding: EdgeInsets.only(left: 40.0),
                                      child: TableHeaderText(
                                          name: Strings.tableHeaderBlock),
                                    )),
                                    DataColumn(
                                        label: Padding(
                                      padding: EdgeInsets.only(left: 40.0),
                                      child: TableHeaderText(
                                          name: Strings.tableHeaderType),
                                    )),
                                    DataColumn(
                                        label: Padding(
                                      padding: EdgeInsets.only(left: 40.0),
                                      child: TableHeaderText(
                                          name: Strings.tableHeaderSummary),
                                    )),
                                    DataColumn(
                                        label: Padding(
                                      padding: EdgeInsets.only(left: 40.0),
                                      child: TableHeaderText(
                                          name: Strings.tableHeaderFee),
                                    )),
                                    DataColumn(
                                        label: Padding(
                                      padding: EdgeInsets.only(left: 40.0),
                                      child: TableHeaderText(
                                          name: Strings.tableHeaderStatus),
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
              footer: Container(
                  color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                  child: const Footer()),
            ),
        error: (error, stack) =>
            const Text('Oops, something unexpected happened'),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
