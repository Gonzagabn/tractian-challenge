import 'package:get/get.dart';
import 'package:tractian_challenge/app/core/base/base_di.dart';
import 'package:tractian_challenge/app/data/client/rest_client.dart';
import 'package:tractian_challenge/app/data/repositories/companies_repository.dart';
import 'package:tractian_challenge/app/data/repositories/locations_repository.dart';
import 'package:tractian_challenge/app/data/repositories/assets_repository.dart';

class RepositoriesDI implements IBaseDI {
  @override
  Future initModules() async {
    Get.lazyPut<ICompaniesRepository>(
      () => CompaniesRepository(
        client: Get.find<IRestClient>(),
      ),
      fenix: true,
    );
    Get.lazyPut<ILocationsRepository>(
      () => LocationsRepository(
        client: Get.find<IRestClient>(),
      ),
      fenix: true,
    );
    Get.lazyPut<IAssetsRepository>(
      () => AssetsRepository(
        client: Get.find<IRestClient>(),
      ),
      fenix: true,
    );
  }
}
