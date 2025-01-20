import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tractian_challenge/app/presentation/screens/assets/assets_screen.dart';
import 'package:tractian_challenge/app/presentation/screens/home/home_screen.dart';

part './routes.dart';

abstract class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static get context => navigatorKey.currentState!.context;

  static GoRouter config() {
    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: RouteLocations.home,
      routes: <RouteBase>[
        GoRoute(
          path: RouteLocations.home,
          name: RouteNames.home,
          builder: (BuildContext context, GoRouterState state) => HomeScreen(),
          routes: <RouteBase>[
            GoRoute(
              path: RouteNames.assets,
              name: RouteNames.assets,
              builder: (BuildContext context, GoRouterState state) =>
                  AssetsScreen(queryParameters: state.uri.queryParameters),
            ),
          ],
        ),
      ],
    );
  }
}
