import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../providers/app_theme_provider.dart';
import '../providers/url_launcher_provider.dart';
import '../utils/theme_color.dart';

/// Icon Footer Column
class RowIconsFooter extends HookConsumerWidget {
  const RowIconsFooter({
    super.key,
    required this.svgIcons,
  });

  final List<Map> svgIcons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    final isResponsive = ResponsiveBreakpoints.of(context).between(MOBILE, TABLET);

    return Row(
      children: [
        ...svgIcons
            .map((svgIcon) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 40,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          final Uri url = Uri.parse(svgIcon['url']);
                          final urlLauncher = ref.read(urlLauncherProvider);
                          urlLauncher.launchURL(url);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              svgIcon['icon'],
                              color: getSelectedColor(colorTheme, 0xFF535757, 0xFFC0C4C4),
                            ),
                            const SizedBox(width: 8), // Add spacing between icon and text
                            Text(
                              svgIcon['text'],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ],
    );
  }
}
