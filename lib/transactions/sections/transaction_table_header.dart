import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../shared/constants/strings.dart';
import '../widgets/custom_transaction_widgets.dart';

/// This is a custom widget that shows the transaction table header
class TransactionTableHeader extends StatelessWidget {
  const TransactionTableHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

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
                    width: isMobile
                        ? 180
                        : isTablet
                            ? 150
                            : 300,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.only(left: isMobile ? 2.0 : 40.0, right: 0, top: 16),
                      child: const TableHeaderText(name: Strings.tableHeaderTxnHashId),
                    )),
                SizedBox(
                    width: isMobile
                        ? 180
                        : isTablet
                            ? 100
                            : 200,
                    height: 60,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: isMobile
                              ? 21.0
                              : isTablet
                                  ? 16.0
                                  : 40.0,
                          top: 16),
                      child: const TableHeaderText(name: Strings.tableHeaderBlock),
                    )),
                if (!isMobile)
                  SizedBox(
                      width: isTablet ? 100 : 200,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.only(left: isTablet ? 16.0 : 40.0, top: 16),
                        child: const TableHeaderText(name: Strings.tableHeaderType),
                      )),
                if (!isMobile)
                  SizedBox(
                      width: isTablet ? 100 : 200,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.only(left: isTablet ? 16.0 : 40.0, top: 16),
                        child: const TableHeaderText(name: Strings.tableHeaderSummary),
                      )),
                if (!isMobile)
                  SizedBox(
                      width: isTablet ? 100 : 150,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.only(left: isTablet ? 16.0 : 40.0, top: 16),
                        child: const TableHeaderText(name: Strings.tableHeaderFee),
                      )),
                if (!isMobile)
                  SizedBox(
                      width: 300,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.only(left: isTablet ? 0 : 40.0, top: 16),
                        child: const TableHeaderText(name: Strings.tableHeaderStatus),
                      )),
              ])),
        ],
      ),
    );
  }
}
