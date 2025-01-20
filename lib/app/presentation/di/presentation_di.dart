import 'package:get/get.dart';
import 'package:tractian_challenge/app/core/base/base_di.dart';
import 'package:tractian_challenge/app/domain/use_cases/assets_use_case.dart';
import 'package:tractian_challenge/app/domain/use_cases/companies_use_case.dart';
import 'package:tractian_challenge/app/domain/use_cases/locations_use_case.dart';
import 'package:tractian_challenge/app/presentation/screens/assets/assets_controller.dart';
import 'package:tractian_challenge/app/presentation/screens/companies/companies_controller.dart';
import 'package:tractian_challenge/app/presentation/screens/home/home_controller.dart';
import 'package:tractian_challenge/app/presentation/screens/locations/locations_controller.dart';

class PresentationDI implements IBaseDI {
  @override
  Future initModules() async {
    Get.lazyPut<AssetsController>(
      () => AssetsController(
        assetsUseCase: Get.find<IAssetsUseCase>(),
      ),
      fenix: true,
    );
    Get.lazyPut<CompaniesController>(
      () => CompaniesController(
        companiesUseCase: Get.find<ICompaniesUseCase>(),
      ),
      fenix: true,
    );
    Get.lazyPut<LocationsController>(
      () => LocationsController(
        locationsUseCase: Get.find<ILocationsUseCase>(),
      ),
      fenix: true,
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );
  }
}
