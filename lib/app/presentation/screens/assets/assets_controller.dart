import 'package:get/get.dart';
import 'package:tractian_challenge/app/core/base/base_controller.dart';
import 'package:tractian_challenge/app/domain/models/asset.dart';
import 'package:tractian_challenge/app/domain/models/company.dart';
import 'package:tractian_challenge/app/domain/models/location.dart';
import 'package:tractian_challenge/app/domain/use_cases/assets_use_case.dart';
import 'package:tractian_challenge/app/domain/use_cases/locations_use_case.dart';

class AssetsController extends BaseController {
  final IAssetsUseCase assetsUseCase;
  final ILocationsUseCase locationsUseCase;

  AssetsController({
    required this.assetsUseCase,
    required this.locationsUseCase,
  });

  final Rx<Company> company = Company(id: "", name: "").obs;
  final Rx<AssetModel> assets = AssetModel().obs;
  final Rx<LocationModel> locations = LocationModel().obs;

  String get companyId => company.value.id;
  String get companyName => company.value.name;

  void onRefresh(String companyId) => getData(companyId);

  Future<void> getData(String companyId) async {
    loadingData.value = true;
    await Future.wait([
      getAssets(companyId),
      getLocations(companyId),
    ]);
    loadingData.value = false;
  }

  Future<dynamic> getAssets(String companyId) async {
    try {
      await assetsUseCase
          .getAssets(companyId)
          .then((data) => assets.value = data);
    } catch (error) {
      throw Exception('AssetsController: getAssets $error');
    }
  }

  Future<dynamic> getLocations(String companyId) async {
    try {
      loadingData.value = true;
      await locationsUseCase
          .getLocations(companyId)
          .then((data) => locations.value = data);
    } catch (error) {
      throw Exception('LocationsController: getLocations $error');
    }
  }
}
