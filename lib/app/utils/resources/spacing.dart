import 'package:flutter/material.dart';

abstract final class SpacingValue {
  static const xxxs = 4.0;
  static const xxs = 8.0;
  static const xs = 16.0;
  static const sm = 24.0;
  static const md = 32.0;
  static const lg = 48.0;
  static const xl = 64.0;
  static const xxl = 128.0;
}

abstract final class VerticalSpacing {
  static const xxxs = SizedBox(height: 4.0);
  static const xxs = SizedBox(height: 8.0);
  static const xs = SizedBox(height: 16.0);
  static const sm = SizedBox(height: 24.0);
  static const md = SizedBox(height: 32.0);
  static const lg = SizedBox(height: 48.0);
  static const xl = SizedBox(height: 64.0);
  static const xxl = SizedBox(height: 128.0);
}

abstract final class HorizontalSpacing {
  static const xxxs = SizedBox(width: 4.0);
  static const xxs = SizedBox(width: 8.0);
  static const xs = SizedBox(width: 16.0);
  static const sm = SizedBox(width: 24.0);
  static const md = SizedBox(width: 32.0);
  static const lg = SizedBox(width: 48.0);
  static const xl = SizedBox(width: 64.0);
  static const xxl = SizedBox(width: 128.0);
}

abstract final class SpacingInset {
  static const xxxs = EdgeInsets.all(4.0);
  static const xxs = EdgeInsets.all(8.0);
  static const xs = EdgeInsets.all(16.0);
  static const sm = EdgeInsets.all(24.0);
  static const md = EdgeInsets.all(32.0);
  static const lg = EdgeInsets.all(48.0);
  static const xl = EdgeInsets.all(64.0);
  static const xxl = EdgeInsets.all(128.0);
}

abstract final class SpacingVerticalInset {
  static const xxxs = EdgeInsets.symmetric(vertical: 4.0);
  static const xxs = EdgeInsets.symmetric(vertical: 8.0);
  static const xs = EdgeInsets.symmetric(vertical: 16.0);
  static const sm = EdgeInsets.symmetric(vertical: 24.0);
  static const md = EdgeInsets.symmetric(vertical: 32.0);
  static const lg = EdgeInsets.symmetric(vertical: 48.0);
  static const xl = EdgeInsets.symmetric(vertical: 64.0);
  static const xxl = EdgeInsets.symmetric(vertical: 128.0);
}

abstract final class SpacingHorizontalInset {
  static const xxxs = EdgeInsets.symmetric(horizontal: 4.0);
  static const xxs = EdgeInsets.symmetric(horizontal: 8.0);
  static const xs = EdgeInsets.symmetric(horizontal: 16.0);
  static const sm = EdgeInsets.symmetric(horizontal: 24.0);
  static const md = EdgeInsets.symmetric(horizontal: 32.0);
  static const lg = EdgeInsets.symmetric(horizontal: 48.0);
  static const xl = EdgeInsets.symmetric(horizontal: 64.0);
  static const xxl = EdgeInsets.symmetric(horizontal: 128.0);
}

abstract final class ButtonSpacing {
  static const sm = EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
  static const md = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
  static const lg = EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0);
}
