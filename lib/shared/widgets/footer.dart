import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../constants/strings.dart';
import '../providers/app_theme_provider.dart';
import '../utils/theme_color.dart';

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
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 40),
                  const SizedBox(
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
                  const SizedBox(
                    width: 80,
                  ),
                  const SizedBox(
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
                  const SizedBox(
                    width: 80,
                  ),
                  const SizedBox(
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
                  const SizedBox(
                    width: 40,
                  ),
                  const SizedBox(
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
                  const SizedBox(
                    width: 40,
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
                          height: 14,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 202,
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
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              height: 40,
                              width: 102,
                              child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          getSelectedColor(colorTheme, 0xFFE2E3E3, 0xFF434648))),
                                  onPressed: null,
                                  child: Text(Strings.subscribe,
                                      style: TextStyle(
                                          color: getSelectedColor(colorTheme, 0xFF000000, 0xFFFEFEFE),
                                          fontSize: 14,
                                          fontFamily: Strings.rationalDisplayFont))),
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
              )
            : const Divider(
                color: Color(0xFFE7E8E8),
                height: 2,
              ),
        const SizedBox(
          height: 20,
        ),
        if (!isDesktop) ResponsiveFooter(colorTheme: colorTheme),
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
            isDesktopAndTab
                ? const Row(
                    children: [
                      SizedBox(
                        width: 80,
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
            Row(
              children: [
                const FooterBottomLinks(text: Strings.footerRightsReserved),
                SizedBox(
                  width: isDesktopAndTab ? 24 : 200,
                ),
                SvgPicture.asset(
                  colorTheme == ThemeMode.light ? 'images/logo.svg' : 'images/logo_dark.svg',
                  width: 32,
                  height: 20,
                ),
                SizedBox(
                  width: isDesktopAndTab ? 80 : 20,
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

class ResponsiveFooter extends StatelessWidget {
  const ResponsiveFooter({
    Key? key,
    required this.colorTheme,
  }) : super(key: key);

  final ThemeMode colorTheme;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    return ResponsiveRowColumn(
      layout: ResponsiveBreakpoints.of(context).smallerOrEqualTo(MOBILE)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: isMobile
              ? Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(0), width: 800, child: FooterContent(colorTheme: colorTheme)),
                    const SizedBox(height: 30),
                    const SizedBox(width: 300, child: RowIcons()),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FooterContent(colorTheme: colorTheme),
                    Container(padding: const EdgeInsets.only(right: 35), child: const RowIcons()),
                  ],
                ),
        ),
      ],
    );
  }
}

class FooterContent extends StatelessWidget {
  const FooterContent({
    super.key,
    required this.colorTheme,
  });

  final ThemeMode colorTheme;

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: isTablet ? 60.0 : 100.0, top: isTablet ? 40 : 0),
          child: Text(
            Strings.footerColumn5Header,
            style: TextStyle(
              color: getSelectedColor(colorTheme, 0xFF282A2C, 0xFFC0C4C4),
              fontSize: 16,
              fontFamily: Strings.rationalDisplayFont,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 5),
          child: Row(
            children: [
              SizedBox(
                width: 202,
                height: 40,
                child: TextField(
                  controller: TextEditingController(text: ''),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Color(0xFFE2E3E3), width: 1),
                    ),
                    hintText: Strings.email,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 40,
                width: 102,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      getSelectedColor(colorTheme, 0xFFE2E3E3, 0xFF434648),
                    ),
                  ),
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
              ),
            ],
          ),
        ),
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
    return const RowIconsFooter(
      svgIcons: [
        'assets/icons/linkedin.svg',
        'assets/icons/github.svg',
        'assets/icons/instagram.svg',
        'assets/icons/facebook.svg',
        'assets/icons/medium.svg',
        'assets/icons/twitter.svg',
      ],
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

  final List<String> svgIcons;

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
                      onPressed: null,
                      icon: SvgPicture.asset(
                        svgIcon,
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
