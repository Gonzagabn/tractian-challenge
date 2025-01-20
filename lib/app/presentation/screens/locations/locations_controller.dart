import 'package:get/get.dart';
import 'package:tractian_challenge/app/core/base/base_controller.dart';
import 'package:tractian_challenge/app/domain/models/location.dart';
import 'package:tractian_challenge/app/domain/use_cases/locations_use_case.dart';

class LocationsController extends BaseController {
  final ILocationsUseCase locationsUseCase;

  LocationsController({required this.locationsUseCase});

  final Rx<LocationModel> locations = LocationModel().obs;

  @override
  void onInit() {
    getLocations();
    super.onInit();
  }

  void onRefresh() => getLocations();

  Future<dynamic> getLocations() async {
    try {
      loadingData.value = true;
      await locationsUseCase
          .getLocations()
          .then((data) => locations.value = data);
    } catch (error) {
      throw Exception('LocationsController: getLocations $error');
    } finally {
      if (locations.value.items.isNotEmpty) emptyData.value = false;
      loadingData.value = false;
    }
  }
}
