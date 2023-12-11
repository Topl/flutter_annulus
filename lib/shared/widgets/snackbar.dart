import 'package:flutter/material.dart';
import 'package:flutter_annulus/shared/constants/strings.dart';
import 'package:flutter_annulus/shared/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

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
    final isTablet = ResponsiveBreakpoints.of(context).equals(TABLET);
    final double screenWidth = MediaQuery.of(context).size.width;

    return SnackBar(
      key: snackBarContentKey,
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xFFFDF3F3),
      duration: const Duration(seconds: 10),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xFFF07575), width: 1),
        borderRadius: BorderRadius.circular(6.0),
      ),
      content: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                key: closeButtonKey,
                icon: const Icon(Icons.close, color: Color.fromARGB(255, 216, 78, 78)),
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
              const Padding(padding: EdgeInsets.only(bottom: 30)),
            ],
          ),
          SizedBox(width: isMobile ? 0 : 16),
          Padding(
            padding: EdgeInsets.all(isMobile ? 0 : 18.0),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.failedToLoadPage,
                    style: bodyMedium(context),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    key: pleaseTryLaterTextKey,
                    Strings.tryAgainLater,
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      key: retryTextKey,
                      Strings.retry,
                      style: titleSmall(context)!.copyWith(color: const Color(0xFF858E8E)),
                    ),
                    IconButton(
                      key: retryButtonKey,
                      onPressed: onRetry ?? () {},
                      icon: SvgPicture.asset('assets/icons/refresh.svg'),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 30)),
            ],
          ),
        ],
      ),
      margin: EdgeInsets.only(
          left: isMobile || isTablet ? 2 : 15, right: isMobile || isTablet ? 2 : screenWidth * 0.65, bottom: 15),
    );
  }
}
