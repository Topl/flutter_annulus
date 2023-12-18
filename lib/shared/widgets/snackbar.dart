import 'package:flutter/material.dart';
import 'package:flutter_annulus/home/screen/home_screen.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:vrouter/vrouter.dart';
import '../constants/strings.dart';

class CustomSnackBar {
  static const Key snackBarContentKey = Key('snackBarContentKey');
  static const Key closeButtonKey = Key('closeButtonKey');
  static const Key retryButtonKey = Key('retryButtonKey');
  static const Key retryTextKey = Key('retryTextKey');
  static const Key pleaseTryLaterTextKey = Key('pleaseTryLaterTextKey');
  static void showSnackBarAndToast(BuildContext context, {Function()? onRetry}) {
    Future.delayed(Duration.zero, () {
      final snackBar = buildSnackBarAndToast(context, onRetry);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  static SnackBar buildSnackBarAndToast(BuildContext context, Function()? onRetry) {
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);
    final double screenWidth = MediaQuery.of(context).size.width;
    return SnackBar(
      key: snackBarContentKey,
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xFFFDF3F3),
      duration: const Duration(milliseconds: 999999),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xFFF07575), width: 1),
        borderRadius: BorderRadius.circular(6.0),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Column(
                children: [
                  IconButton(
                    key: closeButtonKey,
                    icon: const Icon(Icons.close, color: Color.fromARGB(255, 216, 78, 78)),
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20))
                ],
              )
            ],
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  Strings.failedToLoadPage,
                  style: bodyMedium(context),
                ),
                Text(key: pleaseTryLaterTextKey, Strings.tryAgainLater, style: bodySmall(context)),
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      key: retryTextKey,
                      Strings.retry,
                      style: titleSmall(context),
                    ),
                    IconButton(
                      key: retryButtonKey,
                      onPressed: () {
                        VRouter.of(context).to(HomeScreen.route);
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/refresh.svg',
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20))
              ],
            ),
          ),
        ],
      ),
      margin: EdgeInsets.only(
        left: isMobile ? 2 : 15,
        right: isMobile ? 2 : screenWidth * 0.65,
        bottom: 15,
      ),
    );
  }
}
