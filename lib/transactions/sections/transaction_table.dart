import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/sections/transaction_row_item.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';
import '../../constants/strings.dart';
import '../../shared/providers/app_theme_provider.dart';
import '../../shared/widgets/header.dart';
import '../../shared/widgets/layout.dart';

class TransactionTableScreen extends StatefulHookConsumerWidget {
  TransactionTableScreen({Key? key}) : super(key: key);
  static const String route = '/transactions';
  @override
  _TransactionTableScreenState createState() => _TransactionTableScreenState();
}

List<Map> _data = [
  {
    "txnHashId": "0x5be9d701Byd24n...eQfY1vXa987a",
    "type": "Transfer",
    "fee": "2.3",
    "status": "Pending",
    "block": {
      "height": "45,101",
      "slot": "1,0297",
    },
    "summary": {
      "toplValue": "2,450.400",
      "bobsValue": "1,000.001",
    }
  },
  {
    "txnHashId": "0x5be9d701Byd24n...eQfY1vXa987a",
    "type": "Transfer",
    "fee": "2.3",
    "status": "Confirmed",
    "block": {
      "height": "45,102",
      "slot": "1,0297",
    },
    "summary": {
      "toplValue": "2,450.400",
      "bobsValue": "1,000.002",
    }
  },
  {
    "txnHashId": "0x5be9d701Byd24n...eQfY1vXa987a",
    "type": "Transfer",
    "fee": "2.3",
    "status": "Failed",
    "block": {
      "height": "45,103",
      "slot": "1,0297",
    },
    "summary": {
      "toplValue": "2,450.400",
      "bobsValue": "1,000.003",
    }
  },
  {
    "txnHashId": "0x5be9d701Byd24n...eQfY1vXa987a",
    "type": "Transfer",
    "fee": "2.3",
    "status": "Confirmed",
    "block": {
      "height": "45,104",
      "slot": "1,0297",
    },
    "summary": {
      "toplValue": "2,450.400",
      "bobsValue": "1,000.004",
    }
  },
];

class _TransactionTableScreenState
    extends ConsumerState<TransactionTableScreen> {
  bool viewAll = false;
  var _rowsPerPage = 5; //PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final source = RowDataSource(
        _data,
        context,
        (colorTheme == ColorMode.light
            ? Color(0xFFFEFEFE)
            : Color(0xFF282A2C)));

    return CustomLayout(
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
                        left: 40.0, right: 40.0, top: 40.0, bottom: 8.0),
                    child: SizedBox(
                      width: 100.0,
                      height: 50.0,
                      child: TextButton(
                          onPressed: () {
                            context.vRouter.to('/');
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.arrow_back,
                                color: Color(0xFF535757),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Back",
                                style: TextStyle(
                                  color: Color(0xFF535757),
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
                        left: 40.0, right: 40.0, top: 8.0, bottom: 40.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: PaginatedDataTable(
                        source: source,
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
                              /// Update rowsPerPage if the remaining count is less than the default rowsPerPage
                              if (source.rowCount - n < _rowsPerPage) {
                                _rowsPerPage = source.rowCount - n;
                              } else {
                                _rowsPerPage =
                                    PaginatedDataTable.defaultRowsPerPage;
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
                            child:
                                TableHeaderText(name: Strings.tableHeaderType),
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
                            child:
                                TableHeaderText(name: Strings.tableHeaderFee),
                          )),
                          DataColumn(
                              label: Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: TableHeaderText(
                                name: Strings.tableHeaderStatus),
                          )),
                        ],
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
      footer: Container(
        color: colorTheme == ColorMode.light
            ? const Color(0xFFFEFEFE)
            : const Color(0xFF282A2C),
        height: 100,
        alignment: Alignment.center,
        child: const Text("footer"),
      ),
    );
  }
}
