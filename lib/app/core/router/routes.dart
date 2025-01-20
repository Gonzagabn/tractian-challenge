part of 'router.dart';

abstract class RouteLocations {
  static String get assets => '/${RouteNames.home}/${RouteNames.assets}';
  static String get home => '/${RouteNames.home}';
}

abstract class RouteNames {
  static String get assets => 'assets';
  static String get home => 'home';
}
