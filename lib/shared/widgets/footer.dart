import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_annulus/shared/providers/url_launcher_provider.dart';
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
                    SvgPicture.asset(
                      'assets/icons/toplHorizontal.svg',
                      color: getSelectedColor(colorTheme, 0xFF535757, 0xFFC0C4C4),
                    ),
                    const SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RowIcons(),
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
                  ? Padding(
                      padding: EdgeInsets.only(left: isDesktop ? 40 : 0, right: 40),
                      child: Row(
                        children: [
                          SizedBox(
                            width: isDesktopAndTab ? 135 : 200,
                            child: Text(
                              Strings.footerRightsReserved,
                              style: bodySmall(context),
                            ),
                          ),
                        ],
                      ))
                  : const SizedBox(),
            ),
            Row(
              children: [
                const FooterBottomLinks(
                  text: Strings.footerTopl,
                  url: 'https://topl.co/',
                ),
                const SizedBox(
                  width: 24,
                ),
                const FooterBottomLinks(
                  text: Strings.footerFaucet,
                  url: 'https://faucet.topl.co/#/',
                ),
                const SizedBox(
                  width: 24,
                ),
                const FooterBottomLinks(
                  text: Strings.footerRibnWallet,
                  url: '',
                ),
                const SizedBox(
                  width: 48,
                ),
                const FooterBottomLinks(
                  text: Strings.footerContactSupport,
                  url: 'https://discord.gg/Gp7fFq6Wck',
                ),
                const SizedBox(
                  width: 24,
                ),
                const FooterBottomLinks(
                  text: Strings.footerPrivacyPolicy,
                  url: 'https://legal.topl.co/Privacy_Policy',
                ),
                const SizedBox(
                  width: 24,
                ),
                const FooterBottomLinks(
                  text: Strings.footerTermsOfUse,
                  url: 'https://legal.topl.co/Annulus_License_Agreement',
                ),
                SizedBox(
                  width: isDesktopAndTab ? 40 : 200,
                ),
              ],
            )
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
          {'icon': 'assets/icons/twitter.svg', 'url': 'https://twitter.com/topl_protocol', 'text': 'Twitter'},
          {'icon': 'assets/icons/discord.svg', 'url': 'https://discord.gg/Gp7fFq6Wck', 'text': 'Discord'},
          {'icon': 'assets/icons/github.svg', 'url': 'https://github.com/Topl', 'text': 'GitHub'},
          {'icon': 'assets/icons/linkedin.svg', 'url': 'https://www.linkedin.com/company/topl/', 'text': 'LinkedIn'},
          {'icon': 'assets/icons/medium.svg', 'url': 'https://medium.com/topl-blog', 'text': 'Medium'},
        ],
      ),
    );
  }
}

class FooterBottomLinks extends HookConsumerWidget {
  const FooterBottomLinks({
    super.key,
    required this.text,
    required this.url,
  });

  final String text;
  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          final Uri uri = Uri.parse(url);
          final urlLauncher = ref.read(urlLauncherProvider);
          urlLauncher.launchURL(uri);
        },
        child: Text(
          text,
          style: bodySmall(context),
        ),
      ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: isResponsive ? 80 : 105,
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
