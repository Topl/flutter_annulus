import 'package:flutter/cupertino.dart';
import '../../constants/strings.dart';
import '../widgets/custom_transaction_widgets.dart';

class TransactionTableHeader extends StatelessWidget {
  const TransactionTableHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Add what you want to do on tap
        },
        child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: 340,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 16),
                    child: TableHeaderText(name: Strings.tableHeaderTxnHashId),
                  )),
              SizedBox(
                  width: 200,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 16),
                    child: TableHeaderText(name: Strings.tableHeaderBlock),
                  )),
              SizedBox(
                  width: 200,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 16),
                    child: TableHeaderText(name: Strings.tableHeaderType),
                  )),
              SizedBox(
                  width: 200,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 16),
                    child: TableHeaderText(name: Strings.tableHeaderSummary),
                  )),
              SizedBox(
                  width: 150,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 16),
                    child: TableHeaderText(name: Strings.tableHeaderFee),
                  )),
              SizedBox(
                  width: 300,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 16),
                    child: TableHeaderText(name: Strings.tableHeaderStatus),
                  )),
            ]));
  }
}
