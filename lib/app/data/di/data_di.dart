import 'package:tractian_challenge/app/core/base/base_di.dart';
import 'package:tractian_challenge/app/data/client/client_di.dart';
import 'package:tractian_challenge/app/data/repositories/di/repositories_di.dart';

class DataDI implements IBaseDI {
  @override
  Future initModules() async {
    ClientDI().initModules();
    RepositoriesDI().initModules();
  }
}
