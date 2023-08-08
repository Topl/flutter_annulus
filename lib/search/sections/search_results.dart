import 'package:flutter/material.dart';
import 'package:flutter_annulus/search/models/search_result.dart';
import 'package:flutter_annulus/search/providers/search_provider.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchResults extends HookConsumerWidget {
  // final OverlayEntry entry;
  final Function() resultSelected;
  const SearchResults({
    // required this.entry,
    required this.resultSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return Material(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 206, 206, 206),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ref.watch(searchProvider).when(
              data: (List<SearchResult> results) {
                print('QQQQ resultslength: ${results.length}');
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final suggestion = results[index];

                      final displayText = suggestion.id;
                      return ListTile(
                        title: Text(displayText, style: bodyMedium(context)),
                        textColor: getSelectedColor(
                          colorTheme,
                          0xFF4B4B4B,
                          0xFF858E8E,
                        ),
                        onTap: () {
                          resultSelected();
                          // entry.remove();
                          // if (isDesktop && suggestion.length > 6 && suggestion != "10x5be9d701Byd24neQfY1vXa987a") {
                          //   showModalSideSheet(
                          //     context: context,
                          //     ignoreAppBar: true,
                          //     width: 640,
                          //     barrierColor: getSelectedColor(
                          //       colorTheme,
                          //       0xFFFEFEFE,
                          //       0xFF353739,
                          //     ).withOpacity(0.64),
                          //     barrierDismissible: true,
                          //     body: TransactionDetailsDrawer(
                          //       transaction: selectedTransactionId.value[index],
                          //     ),
                          //   );
                          // } else if (!isDesktop &&
                          //     suggestion.length > 6 &&
                          //     suggestion != "10x5be9d701Byd24neQfY1vXa987a") {
                          //   context.vRouter.to(
                          //     '/transactions_details/',
                          //   );
                          // } else if (suggestion == "10x5be9d701Byd24neQfY1vXa987a") {
                          //   context.vRouter.to(
                          //     '/utxo_details/',
                          //   );
                          // } else {
                          //   isDesktop
                          //       ? showModalSideSheet(
                          //           context: context,
                          //           ignoreAppBar: true,
                          //           width: 640,
                          //           barrierColor: getSelectedColor(
                          //             colorTheme,
                          //             0xFFFEFEFE,
                          //             0xFF353739,
                          //           ).withOpacity(0.64),
                          //           barrierDismissible: true,
                          //           body: BlockDetailsDrawer(
                          //             block: selectedBlock.value as Block,
                          //           ),
                          //         )
                          //       : context.vRouter.to("/block_details");
                          // }
                        },
                      );
                    },
                  ),
                );
              },
              error: (error, strackTrace) => const Center(
                child: Text("Error"),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }
}
