import 'package:tractian_challenge/app/data/di/data_di.dart';
import 'package:tractian_challenge/app/domain/di/domain_di.dart';
import 'package:tractian_challenge/app/presentation/di/presentation_di.dart';

interface class IBaseDI {
  Future initModules() async {}
}

class DependencyInjectonHandler {
  static final List<IBaseDI> _diModules = [
    DataDI(),
    DomainDI(),
    PresentationDI(),
  ];

  static void registerAllModules() {
    _diModules.map((IBaseDI module) async => module.initModules()).toList();
  }
}
