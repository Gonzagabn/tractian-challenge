import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tractian_challenge/app/core/base/base_di.dart';
import 'package:tractian_challenge/tractian_app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjectonHandler.registerAllModules();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const TractianApp()),
  );

  runApp(const TractianApp());
}
