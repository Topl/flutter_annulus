import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/transactions/widgets/paginated_transaction_table.dart';
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
class TransactionTableScreen extends HookConsumerWidget {
  const TransactionTableScreen({Key? key}) : super(key: key);
  static const String route = '/transactions';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

    final colorTheme = ref.watch(appThemeColorProvider);
    final AsyncValue<List<Transaction>> transactionsInfo = ref.watch(transactionsProvider);

    return transactionsInfo.when(
        data: (transactions) => CustomLayout(
              header: Header(
                logoAsset: colorTheme == ThemeMode.light ? 'assets/icons/logo.svg' : 'assets/icons/logo_dark.svg',
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
                                        Strings.backText,
                                        style: bodyMedium(context),
                                      ),
                                    ],
                                  )),
                            )),
                        Container(
                            margin: EdgeInsets.only(
                                left: isMobile ? 16.0 : 40.0, right: isMobile ? 0 : 40.0, top: 8.0, bottom: 80.0),
                            height: isTablet ? MediaQuery.of(context).size.height - 435 : null,
                            child: SingleChildScrollView(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  cardColor: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
                                ),
                                child: PaginatedTransactionTable(
                                  transactions: transactions,
                                  showAllColumns: true,
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
