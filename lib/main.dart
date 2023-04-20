import 'package:flutter/material.dart';
import 'package:flutter_annulus/presentation/header.dart';
import 'package:flutter_annulus/presentation/layout.dart';
import 'widgets/block_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_annulus/providers/app_theme_provider.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: AnnulusApp()));
}

class AnnulusApp extends ConsumerWidget {
  const AnnulusApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(appThemeColorProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Annulus Event Explorer',
      home: CustomLayout(
        header: Header(
          logoAsset: colorTheme == ColorMode.light
              ? 'images/logo.svg'
              : 'images/logo_dark.svg',
          onSearch: () {},
          onDropdownChanged: (String value) {},
        ),
        content: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: HeroMetrics(),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.red,
                        child: const Text("right"),
                      ))
                ],
              ),
            ),
            // const BlockViewSlider()
          ],
        ),
        footer: Container(
          height: 100,
          alignment: Alignment.center,
          child: const Text("footer"),
        ),
      ),
    );
  }
}

class HeroMetrics extends StatelessWidget {
  const HeroMetrics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
            color: const Color(0xFFE7E8E8),
            style: BorderStyle.solid,
            width: 1.0),
      ),
      height: 408,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Top Metrics
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(42.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'images/speedometer.svg',
                          width: 20.0,
                          height: 16.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 14),
                          child: const Text(
                            "Data Throughput",
                            style: TextStyle(
                              color: Color(0xFF858E8E),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: Row(
                              children: const [
                                Text(
                                  "39.887",
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  " kbps",
                                  style: TextStyle(
                                    color: Color(0xFF535757),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                    color: Color(0xFFE7E8E8),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'images/coin.svg',
                            width: 20.0,
                            height: 16.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 14),
                            child: const Text(
                              "Average Transaction Fee",
                              style: TextStyle(
                                color: Color(0xFF858E8E),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 16),
                              child: Row(
                                children: const [
                                  Text(
                                    "3.71",
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    " LVL",
                                    style: TextStyle(
                                      color: Color(0xFF535757),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                    color: Color(0xFFE7E8E8),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'images/wallet.svg',
                            width: 20.0,
                            height: 16.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 14),
                            child: const Text(
                              "Unique Active Addresses",
                              style: TextStyle(
                                color: Color(0xFF858E8E),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: Row(
                              children: const [
                                Text(
                                  "2,076",
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  " /3,135",
                                  style: TextStyle(
                                    color: Color(0xFF535757),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Color(0xFFE7E8E8),
            indent: 0,
          ),
          //Bottom Metrics
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32.0, horizontal: 40.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Eon",
                              style: TextStyle(
                                color: Color(0xFF858E8E),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "2",
                              style: TextStyle(
                                color: Color(0xFF282A2C),
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Era",
                              style: TextStyle(
                                color: Color(0xFF858E8E),
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "5",
                              style: TextStyle(
                                color: Color(0xFF282A2C),
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(
                  indent: 0,
                  endIndent: 0,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 40.0),
                          child: Row(children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "72,109",
                                    style: TextStyle(
                                      color: Color(0xFF282A2C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Epoch",
                                    style: TextStyle(
                                      color: Color(0xFF858E8E),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const VerticalDivider(
                              indent: 5,
                              endIndent: 10,
                              thickness: 1,
                              color: Color(0xFFE7E8E8),
                            ),
                            Expanded(
                                child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "266",
                                    style: TextStyle(
                                      color: Color(0xFF282A2C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Txs",
                                    style: TextStyle(
                                      color: Color(0xFF858E8E),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            )),
                            const VerticalDivider(
                              indent: 5,
                              endIndent: 10,
                              thickness: 1,
                              color: Color(0xFFE7E8E8),
                            ),
                            Expanded(
                                child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "22,100,762",
                                    style: TextStyle(
                                      color: Color(0xFF282A2C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Height",
                                    style: TextStyle(
                                      color: Color(0xFF858E8E),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            )),
                            const VerticalDivider(
                              indent: 10,
                              endIndent: 10,
                              thickness: 1,
                              color: Color(0xFFE7E8E8),
                            ),
                            Expanded(
                                child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "127 sec",
                                    style: TextStyle(
                                      color: Color(0xFF282A2C),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Avg Block Time",
                                    style: TextStyle(
                                      color: Color(0xFF858E8E),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            )),
                          ]),
                        ),
                      ),
                      const Divider(
                        color: Color(0xFFE7E8E8),
                        indent: 0,
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 40.0),
                          child: Row(children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "72,109",
                                          style: TextStyle(
                                            color: Color(0xFF282A2C),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Epoch",
                                          style: TextStyle(
                                            color: Color(0xFF858E8E),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: Icon(
                                      Icons.info_outline,
                                      color: Color(0xFF858E8E),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const VerticalDivider(
                              indent: 5,
                              endIndent: 10,
                              thickness: 1,
                              color: Color(0xFFE7E8E8),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "72,109",
                                          style: TextStyle(
                                            color: Color(0xFF282A2C),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Epoch",
                                          style: TextStyle(
                                            color: Color(0xFF858E8E),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: Icon(
                                      Icons.info_outline,
                                      color: Color(0xFF858E8E),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const VerticalDivider(
                              indent: 5,
                              endIndent: 10,
                              thickness: 1,
                              color: Color(0xFFE7E8E8),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "72,109",
                                          style: TextStyle(
                                            color: Color(0xFF282A2C),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Epoch",
                                          style: TextStyle(
                                            color: Color(0xFF858E8E),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: Icon(
                                      Icons.info_outline,
                                      color: Color(0xFF858E8E),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const VerticalDivider(
                              indent: 10,
                              endIndent: 10,
                              thickness: 1,
                              color: Color(0xFFE7E8E8),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "72,109",
                                          style: TextStyle(
                                            color: Color(0xFF282A2C),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Epoch",
                                          style: TextStyle(
                                            color: Color(0xFF858E8E),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    child: Icon(
                                      Icons.info_outline,
                                      color: Color(0xFF858E8E),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
