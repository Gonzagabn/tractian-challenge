import 'package:flutter/material.dart';
import 'package:tractian_challenge/app/core/router/router.dart';

class TractianApp extends StatefulWidget {
  const TractianApp({super.key});

  @override
  State<TractianApp> createState() => _TractianAppState();
}

class _TractianAppState extends State<TractianApp> {
  late RouterConfig<Object>? _routerConfig;

  @override
  void initState() {
    _routerConfig = AppRouter.config();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Tractian App",
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: true,
      routerConfig: _routerConfig,
    );
  }
}
