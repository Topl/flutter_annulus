import 'package:flutter/material.dart';
import 'package:flutter_annulus/transactions/widgets/custom_transaction_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vrouter/vrouter.dart';
import '../../constants/strings.dart';
import '../../shared/widgets/header.dart';
import '../../shared/widgets/layout.dart';

class TransactionTableScreen extends StatefulHookConsumerWidget {
  TransactionTableScreen({Key? key}) : super(key: key);
  static const String route = '/transactions';
  @override
  _TransactionTableScreenState createState() => _TransactionTableScreenState();
}

class _TransactionTableScreenState
    extends ConsumerState<TransactionTableScreen> {
  bool viewAll = false;
  var _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  final _source = MyTableSource();
  @override
  Widget build(BuildContext context) {
    //final colorTheme = ref.watch(appThemeColorProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Annulus Event Explorer',
      home: CustomLayout(
        header: Header(
          logoAsset: 'images/logo.svg',
          onSearch: () {},
          onDropdownChanged: (String value) {},
        ),
        content: Column(
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
                        source: _source,
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
                              debugPrint(
                                  'onRowsPerPageChanged $_rowsPerPage ${_source._rowCount - n}');

                              /// Update rowsPerPage if the remaining count is less than the default rowsPerPage
                              if (_source._rowCount - n < _rowsPerPage)
                                _rowsPerPage = _source._rowCount - n;

                              /// else, restore default rowsPerPage value
                              else
                                _rowsPerPage =
                                    PaginatedDataTable.defaultRowsPerPage;
                            } else
                              _rowsPerPage = 0;
                          });
                        },
                        columns: const [
                          DataColumn(
                            label: TableHeaderText(
                                name: Strings.tableHeaderTxnHashId),
                          ),
                          DataColumn(
                              label: TableHeaderText(
                                  name: Strings.tableHeaderBlock)),
                          DataColumn(
                              label: TableHeaderText(
                                  name: Strings.tableHeaderType)),
                          DataColumn(
                              label: TableHeaderText(
                                  name: Strings.tableHeaderSummary)),
                          DataColumn(
                              label: TableHeaderText(
                                  name: Strings.tableHeaderFee)),
                          DataColumn(
                              label: TableHeaderText(
                                  name: Strings.tableHeaderStatus)),
                        ],
                      ),
                    )),
              ],
            )
          ],
        ),
        footer: Container(
          height: 100,
          alignment: Alignment.center,
          child: const Text("footer"),
        ),
      ),
    );
  }
}

class RowData {
  final int index;
  final String value;

  RowData(this.index, this.value);
}

class MyTableSource extends DataTableSource {
  final List<Map> _data = [
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
  final _rowCount = 10;
  @override
  DataRow? getRow(int index) {
    final row = _data[index];
    if (index < _data.length) {
      return DataRow(cells: <DataCell>[
        DataCell(TransactionColumnText(
          textTop: row["txnHashId"],
          textBottom: "49 ${Strings.secAgo}",
        )),
        DataCell(TransactionColumnText(
          textTop: '${Strings.height}: ${row['block']['height']}',
          textBottom: '${Strings.slot}: ${row["block"]["slot"]}',
        )),
        DataCell(TransactionColumnText(
          textTop: row["type"],
          textBottom: "",
          isBottomTextRequired: false,
        )),
        DataCell(TransactionColumnText(
            textTop: '${row["summary"]["toplValue"]} ${Strings.topl}',
            textBottom: '${row["summary"]["bobsValue"]} ${Strings.bobs}')),
        DataCell(TransactionColumnText(
          textTop: '${row["fee"]} ${Strings.feeAcronym}',
          textBottom: "",
          isBottomTextRequired: false,
        )),
        DataCell(StatusButton(status: row["status"])),
      ]);
    } else
      return null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
