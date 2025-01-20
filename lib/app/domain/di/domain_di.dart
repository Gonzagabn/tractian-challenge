import 'package:get/get.dart';
import 'package:tractian_challenge/app/core/base/base_di.dart';
import 'package:tractian_challenge/app/data/repositories/companies_repository.dart';
import 'package:tractian_challenge/app/data/repositories/locations_repository.dart';
import 'package:tractian_challenge/app/data/repositories/assets_repository.dart';
import 'package:tractian_challenge/app/domain/use_cases/assets_use_case.dart';
import 'package:tractian_challenge/app/domain/use_cases/companies_use_case.dart';
import 'package:tractian_challenge/app/domain/use_cases/locations_use_case.dart';

class DomainDI implements IBaseDI {
  @override
  Future initModules() async {
    Get.lazyPut<IAssetsUseCase>(
      () => AssetsUseCase(
        assetsRepository: Get.find<IAssetsRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut<ICompaniesUseCase>(
      () => CompaniesUseCase(
        companiesRepository: Get.find<ICompaniesRepository>(),
      ),
      fenix: true,
    );
    Get.lazyPut<ILocationsUseCase>(
      () => LocationsUseCase(
        locationsRepository: Get.find<ILocationsRepository>(),
      ),
      fenix: true,
    );
  }
}
