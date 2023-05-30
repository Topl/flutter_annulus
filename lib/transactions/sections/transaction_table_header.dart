import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../shared/constants/strings.dart';
import '../widgets/custom_transaction_widgets.dart';

class TransactionTableHeader extends StatelessWidget {
  const TransactionTableHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    return GestureDetector(
      onTap: () {
        // Add what you want to do on tap
      },
      child: Row(
        children: [
          Expanded(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                SizedBox(
                    width: isMobile ? 180 : 300,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: isMobile ? 2.0 : 40.0, right: 0, top: 16),
                      child: const TableHeaderText(
                          name: Strings.tableHeaderTxnHashId),
                    )),
                SizedBox(
                    width: isMobile ? 180 : 200,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: isMobile ? 21.0 : 40.0, top: 16),
                      child:
                          const TableHeaderText(name: Strings.tableHeaderBlock),
                    )),
                if (!isMobile)
                  const SizedBox(
                      width: 200,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.0, top: 16),
                        child: TableHeaderText(name: Strings.tableHeaderType),
                      )),
                if (!isMobile)
                  const SizedBox(
                      width: 200,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.0, top: 16),
                        child:
                            TableHeaderText(name: Strings.tableHeaderSummary),
                      )),
                if (!isMobile)
                  const SizedBox(
                      width: 150,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.0, top: 16),
                        child: TableHeaderText(name: Strings.tableHeaderFee),
                      )),
                if (!isMobile)
                  const SizedBox(
                      width: 300,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.0, top: 16),
                        child: TableHeaderText(name: Strings.tableHeaderStatus),
                      )),
              ])),
        ],
      ),
    );
  }
}
