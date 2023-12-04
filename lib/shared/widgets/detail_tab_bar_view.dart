import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/providers/app_theme_provider.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/utils/theme_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailTabBarView extends HookConsumerWidget {
  final AsyncValue data;
  final Widget Function(dynamic) child;
  const DetailTabBarView({
    required this.child,
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);

    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 645,
        decoration: BoxDecoration(
          color: getSelectedColor(colorTheme, 0xFFFEFEFE, 0xFF282A2C),
        ),
        child: data.when(
          error: (error, stackTrace) => Center(
            child: Text(
              error.toString(),
              style: headlineLarge(context),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (dynamic data) {
            return child(data);
          },
        ),
      ),
    );
  }
}
