import 'package:flutter/widgets.dart';
import 'package:tractian_challenge/app/core/router/router.dart';

class ScreenSize {
  static final Size _mediaQuerySize = MediaQuery.sizeOf(AppRouter.context);
  static final EdgeInsets _mediaQueryPadding =
      MediaQuery.paddingOf(AppRouter.context);

  static final double height = _mediaQuerySize.height;
  static final double width = _mediaQuerySize.width;

  static final double paddingTop = _mediaQueryPadding.top;
  static final double paddingBottom = _mediaQueryPadding.bottom;

  /// height percent
  static double hp(y) => y * height / 100;

  /// width percent
  static double wp(x) => x * width / 100;
}
