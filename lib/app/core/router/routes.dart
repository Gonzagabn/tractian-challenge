part of 'router.dart';

abstract class RouteLocations {
  static String get assets => '/${RouteNames.home}/${RouteNames.assets}';
  static String get companies => '/${RouteNames.home}/${RouteNames.companies}';
  static String get home => '/${RouteNames.home}';
  static String get locations => '/${RouteNames.home}/${RouteNames.locations}';
}

abstract class RouteNames {
  static String get assets => 'assets';
  static String get companies => 'companies';
  static String get home => 'home';
  static String get locations => 'locations';
}
