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
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              TableHeaderText(name: Strings.tableHeaderTxnHashId),
              TableHeaderText(name: Strings.tableHeaderBlock),
              TableHeaderText(name: Strings.tableHeaderType),
              TableHeaderText(name: Strings.tableHeaderSummary),
              TableHeaderText(name: Strings.tableHeaderFee),
              TableHeaderText(name: Strings.tableHeaderStatus),
            ]));
  }
}
