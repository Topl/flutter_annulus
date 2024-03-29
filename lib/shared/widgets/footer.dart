import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../constants/strings.dart';
import '../providers/app_theme_provider.dart';
import '../utils/theme_color.dart';
import 'custom_shared.dart';

/// Footer Widget
class Footer extends HookConsumerWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDesktop = ResponsiveBreakpoints.of(context).equals(DESKTOP);
    final isDesktopAndTab = ResponsiveBreakpoints.of(context).between(TABLET, DESKTOP);

    final colorTheme = ref.watch(appThemeColorProvider);
    return Column(
      children: [
        isDesktop
            ? Padding(
                padding: EdgeInsets.only(left: isDesktop ? 40 : 0, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: SizedBox(
                        width: 200,
                        child: FooterColumn(
                          footerTitle: Strings.footerColumn1Header,
                          footerLinks: [
                            Strings.footerColumn1Item1,
                            Strings.footerColumn1Item2,
                            Strings.footerColumn1Item3,
                            Strings.footerColumn1Item4,
                            Strings.footerColumn1Item5,
                            Strings.footerColumn1Item6
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 80,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 200,
                        child: FooterColumn(
                          footerTitle: Strings.footerColumn2Header,
                          footerLinks: [
                            Strings.footerColumn2Item1,
                            Strings.footerColumn2Item2,
                            Strings.footerColumn2Item3,
                            Strings.footerColumn2Item4,
                            Strings.footerColumn2Item5
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 80,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 200,
                        child: FooterColumn(
                          footerTitle: Strings.footerColumn3Header,
                          footerLinks: [
                            Strings.footerColumn3Item1,
                            Strings.footerColumn3Item2,
                            Strings.footerColumn3Item3,
                            Strings.footerColumn3Item4,
                            Strings.footerColumn3Item5
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 40,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 200,
                        child: FooterColumn(
                          footerTitle: Strings.footerColumn4Header,
                          footerLinks: [
                            Strings.footerColumn4Item1,
                            Strings.footerColumn4Item2,
                            Strings.footerColumn4Item3,
                            Strings.footerColumn4Item4,
                            Strings.footerColumn4Item5
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 40,
                      ),
                    ),
                    SizedBox(
                      width: 312,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.footerColumn5Header,
                            style: TextStyle(
                                color: getSelectedColor(colorTheme, 0xFF282A2C, 0xFFC0C4C4),
                                fontSize: 16,
                                fontFamily: Strings.rationalDisplayFont,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 204,
                                height: 40,
                                child: TextField(
                                  controller: TextEditingController(text: ''),
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          borderSide: BorderSide(color: Color(0xFFE2E3E3), width: 1)),
                                      hintText: Strings.email),
                                ),
                              ),
                              const Expanded(
                                child: SizedBox(
                                  width: 8,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 102,
                                child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          getSelectedColor(colorTheme, 0xFFE2E3E3, 0xFF434648))),
                                  onPressed: null,
                                  child: Text(
                                    Strings.subscribe,
                                    style: TextStyle(
                                      color: getSelectedColor(colorTheme, 0xFF000000, 0xFFFEFEFE),
                                      fontSize: 14,
                                      fontFamily: Strings.rationalDisplayFont,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const RowIcons(),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const Divider(
                color: Color(0xFFE7E8E8),
                height: 2,
              ),
        const SizedBox(
          height: 20,
        ),
        if (!isDesktop)
          ResponsiveFooter(
            colorTheme: colorTheme,
            rowIcons: const RowIcons(),
          ),
        if (!isDesktop)
          const SizedBox(
            height: 20,
          ),
        const Divider(
          color: Color(0xFFE7E8E8),
          height: 1,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: isDesktopAndTab
                  ? const Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        FooterBottomLinks(text: Strings.footerPrivacyPolicy),
                        SizedBox(
                          width: 24,
                        ),
                        FooterBottomLinks(text: Strings.footerTermsOfUse),
                        SizedBox(
                          width: 24,
                        ),
                        FooterBottomLinks(text: Strings.footerCookiePolicy),
                        SizedBox(
                          width: 24,
                        ),
                        FooterBottomLinks(text: Strings.footerCookiePreferences),
                      ],
                    )
                  : const SizedBox(),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: isDesktopAndTab ? 135 : 200,
                    child: const FooterBottomLinks(text: Strings.footerRightsReserved)),
                SizedBox(
                  width: isDesktopAndTab ? 24 : 200,
                ),
                SvgPicture.asset(
                  colorTheme == ThemeMode.light ? 'assets/icons/logo.svg' : 'assets/icons/logo_dark.svg',
                  width: 32,
                  height: 20,
                ),
                SizedBox(
                  width: isDesktopAndTab ? 60 : 20,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class RowIcons extends StatelessWidget {
  const RowIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: RowIconsFooter(
        svgIcons: [
          {'icon': 'assets/icons/linkedin.svg', 'url': 'https://www.linkedin.com/company/topl/'},
          {'icon': 'assets/icons/github.svg', 'url': 'https://github.com/Topl'},
          {'icon': 'assets/icons/instagram.svg', 'url': 'https://www.instagram.com/topl_protocol/'},
          {'icon': 'assets/icons/medium.svg', 'url': 'https://medium.com/topl-blog'},
          {'icon': 'assets/icons/twitter.svg', 'url': 'https://twitter.com/topl_protocol'}
        ],
      ),
    );
  }
}

class FooterBottomLinks extends HookConsumerWidget {
  const FooterBottomLinks({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      text,
      style: bodySmall(context),
    );
  }
}

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
            .map(
              (svgIcon) => Row(
                children: [
                  Container(
                    width: isResponsive ? 32 : 42,
                    height: 40,
                    decoration: BoxDecoration(
                      color: getSelectedColor(colorTheme, 0xFFE2E3E3, 0xFF434648),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        //TODO: P.S line only applicable to web version
                        html.window.open(svgIcon['url'], "");
                      },
                      icon: SvgPicture.asset(
                        svgIcon['icon'],
                        color: getSelectedColor(colorTheme, 0xFF535757, 0xFFC0C4C4),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: svgIcon == svgIcons.last ? 0 : 12,
                  ),
                ],
              ),
            )
            .toList(),
      ],
    );
  }
}

/// Footer Column Widget
class FooterColumn extends HookConsumerWidget {
  const FooterColumn({
    super.key,
    required this.footerLinks,
    required this.footerTitle,
  });
  final List<String> footerLinks;
  final String footerTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          footerTitle,
          style: const TextStyle(
              color: Color(0xFF858E8E),
              fontSize: 16,
              fontFamily: Strings.rationalDisplayFont,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 16,
        ),
        ...footerLinks
            .map((text) => Column(
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          color: getSelectedColor(colorTheme, 0xFF535757, 0xFFC0C4C4),
                          fontSize: 14,
                          fontFamily: Strings.rationalDisplayFont),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ))
            .toList()
      ],
    );
  }
}
