import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/app/core/base/base_stateless_screen.dart';
import 'package:tractian_challenge/app/presentation/screens/locations/locations_controller.dart';

class LocationsScreen extends BaseStatelessScreen<LocationsController> {
  LocationsScreen({super.key, LocationsController? controller})
      : super(
          controller: controller ?? Get.find<LocationsController>(),
        );

  @override
  String appBarTitle(LocationsController controller) => 'Locations';

  @override
  IconData? appBarIconData(LocationsController controller) =>
      Icons.web_asset_sharp;

  @override
  Future<void> onRefresh() async => controller.onRefresh();

  @override
  Widget defaultBody(BuildContext context) {
    return Obx(
      () => controller.loadingData.value
          ? ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 8.0 : 0.0,
                    bottom: 8.0,
                  ),
                  child: Container(),
                );
              },
            )
          : Text("algo aqui"),
    );
  }
}
