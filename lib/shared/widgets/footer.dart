import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../providers/app_theme_provider.dart';

/// Footer Widget
class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.colorTheme,
  });

  final ColorMode colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 80),
            SizedBox(
              width: 200,
              child: FooterColumn(
                colorTheme: colorTheme,
                footerTitle: 'Protocol',
                footerLinks: const [
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
            SizedBox(
              width: 200,
              child: FooterColumn(
                colorTheme: colorTheme,
                footerTitle: 'Solutions',
                footerLinks: const [
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
            SizedBox(
              width: 200,
              child: FooterColumn(
                colorTheme: colorTheme,
                footerTitle: 'Blockchain',
                footerLinks: const [
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
            SizedBox(
              width: 200,
              child: FooterColumn(
                colorTheme: colorTheme,
                footerTitle: 'About',
                footerLinks: const [
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
                          color: colorTheme == ColorMode.light
                              ? const Color(0xFF282A2C)
                              : const Color(0xFFC0C4C4),
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
                                      colorTheme == ColorMode.light
                                          ? const Color(0xFFE2E3E3)
                                          : const Color(0xFF434648))),
                              onPressed: null,
                              child: Text("Subscribe",
                                  style: TextStyle(
                                      color: colorTheme == ColorMode.light
                                          ? const Color(0xFF000000)
                                          : const Color(0xFFFEFEFE),
                                      fontSize: 14,
                                      fontFamily: 'Rational Display'))),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    RowIconsFooter(
                      colorTheme: colorTheme,
                      svgIcons: const [
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
            Row(
              children: [
                const SizedBox(
                  width: 80,
                ),
                FooterBottomLinks(
                    colorTheme: colorTheme, text: "Topl Privacy Policy"),
                const SizedBox(
                  width: 24,
                ),
                FooterBottomLinks(colorTheme: colorTheme, text: "Terms of Use"),
                const SizedBox(
                  width: 24,
                ),
                FooterBottomLinks(
                    colorTheme: colorTheme, text: "Use of Cookies"),
                const SizedBox(
                  width: 24,
                ),
                FooterBottomLinks(
                    colorTheme: colorTheme, text: "Cookie Preferences"),
              ],
            ),
            Row(
              children: [
                FooterBottomLinks(
                    colorTheme: colorTheme, text: "2023 © All rights reserved"),
                const SizedBox(
                  width: 24,
                ),
                SvgPicture.asset(
                  'assets/icons/topl-logo-main.svg',
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

class FooterBottomLinks extends StatelessWidget {
  const FooterBottomLinks({
    super.key,
    required this.colorTheme,
    required this.text,
  });

  final ColorMode colorTheme;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: colorTheme == ColorMode.light
              ? const Color(0xFF858E8E)
              : const Color(0xFFC0C4C4),
          fontSize: 12,
          fontFamily: 'Rational Display',
          fontWeight: FontWeight.w400),
    );
  }
}

/// Icon Footer Column
class RowIconsFooter extends StatelessWidget {
  const RowIconsFooter({
    super.key,
    required this.colorTheme,
    required this.svgIcons,
  });

  final List<String> svgIcons;
  final ColorMode colorTheme;

  @override
  Widget build(BuildContext context) {
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
                      color: colorTheme == ColorMode.light
                          ? const Color(0xFFE2E3E3)
                          : const Color(0xFF434648),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: null,
                      icon: SvgPicture.asset(
                        svgIcon,
                        color: colorTheme == ColorMode.light
                            ? const Color(0xFF535757)
                            : const Color(0xFFC0C4C4),
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
class FooterColumn extends StatelessWidget {
  const FooterColumn({
    super.key,
    required this.colorTheme,
    required this.footerLinks,
    required this.footerTitle,
  });
  final List<String> footerLinks;
  final String footerTitle;
  final ColorMode colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          footerTitle,
          style: TextStyle(
              color: const Color(0xFF858E8E),
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
                          color: colorTheme == ColorMode.light
                              ? const Color(0xFF535757)
                              : const Color(0xFFC0C4C4),
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
