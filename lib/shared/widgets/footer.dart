import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/app_theme_provider.dart';
import '../utils/theme_color.dart';

/// Footer Widget
class Footer extends HookConsumerWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 80),
            const SizedBox(
              width: 200,
              child: FooterColumn(
                footerTitle: 'Protocol',
                footerLinks: [
                  'Energy Efficient Regularized PoS',
                  'UTxO Ledger and Achieving Scalability',
                  'User Ecosystem, Standards and Development',
                  'Tokenomics',
                  'Governance',
                  'Ribn',
                ],
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            const SizedBox(
              width: 200,
              child: FooterColumn(
                footerTitle: 'Solutions',
                footerLinks: [
                  'ToplTrax',
                  'Traceable Journey',
                  'Smart Labels',
                  'Impact NFTs',
                  'Blockchain-As-A-Service',
                ],
              ),
            ),
            const SizedBox(
              width: 80,
            ),
            const SizedBox(
              width: 200,
              child: FooterColumn(
                footerTitle: 'Blockchain',
                footerLinks: [
                  'Buid',
                  'Brambl',
                  'Grant Programs',
                  'Node Setup',
                  'Knowledge Base',
                ],
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            const SizedBox(
              width: 200,
              child: FooterColumn(
                footerTitle: 'About',
                footerLinks: [
                  'Team',
                  'Community',
                  'Careers',
                  'Press and Media',
                  'Contact Us',
                ],
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            SizedBox(
              width: 312,
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Subscribe to Our Newsletter",
                      style: TextStyle(
                          color: getSelectedColor(
                              colorTheme, 0xFF282A2C, 0xFFC0C4C4),
                          fontSize: 16,
                          fontFamily: 'Rational Display',
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(
                                          color: Color(0xFFE2E3E3), width: 1)),
                                  hintText: 'Email'),
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
                                      getSelectedColor(
                                          colorTheme, 0xFFE2E3E3, 0xFF434648))),
                              onPressed: null,
                              child: Text("Subscribe",
                                  style: TextStyle(
                                      color: getSelectedColor(
                                          colorTheme, 0xFF000000, 0xFFFEFEFE),
                                      fontSize: 14,
                                      fontFamily: 'Rational Display'))),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const RowIconsFooter(
                      svgIcons: [
                        'assets/icons/linkedin.svg',
                        'assets/icons/github.svg',
                        'assets/icons/instagram.svg',
                        'assets/icons/facebook.svg',
                        'assets/icons/medium.svg',
                        'assets/icons/twitter.svg',
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
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
            const Row(
              children: [
                SizedBox(
                  width: 80,
                ),
                FooterBottomLinks(text: "Topl Privacy Policy"),
                SizedBox(
                  width: 24,
                ),
                FooterBottomLinks(text: "Terms of Use"),
                SizedBox(
                  width: 24,
                ),
                FooterBottomLinks(text: "Use of Cookies"),
                SizedBox(
                  width: 24,
                ),
                FooterBottomLinks(text: "Cookie Preferences"),
              ],
            ),
            Row(
              children: [
                const FooterBottomLinks(text: "2023 © All rights reserved"),
                const SizedBox(
                  width: 24,
                ),
                SvgPicture.asset(
                  colorTheme == ColorMode.light
                      ? 'images/logo.svg'
                      : 'images/logo_dark.svg',
                  width: 32,
                  height: 20,
                ),
                const SizedBox(
                  width: 80,
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

class FooterBottomLinks extends HookConsumerWidget {
  const FooterBottomLinks({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return Text(
      text,
      style: TextStyle(
          color: getSelectedColor(colorTheme, 0xFF858E8E, 0xFFC0C4C4),
          fontSize: 12,
          fontFamily: 'Rational Display',
          fontWeight: FontWeight.w400),
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
    return Row(
      children: [
        ...svgIcons
            .map(
              (svgIcon) => Row(
                children: [
                  Container(
                    width: 42,
                    height: 40,
                    decoration: BoxDecoration(
                      color:
                          getSelectedColor(colorTheme, 0xFFE2E3E3, 0xFF434648),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(
                        svgIcon,
                        color: getSelectedColor(
                            colorTheme, 0xFF535757, 0xFFC0C4C4),
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
              fontFamily: 'Rational Display',
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
                          color: getSelectedColor(
                              colorTheme, 0xFF535757, 0xFFC0C4C4),
                          fontSize: 14,
                          fontFamily: 'Rational Display'),
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
