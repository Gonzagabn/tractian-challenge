import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tractian_challenge/app/core/base/base_stateless_screen.dart';
import 'package:tractian_challenge/app/presentation/screens/home/home_controller.dart';

class HomeScreen extends BaseStatelessScreen<HomeController> {
  HomeScreen({super.key, HomeController? controller})
      : super(
          controller: controller ?? Get.find<HomeController>(),
        );

  @override
  void onBackAction(BuildContext context, HomeController controller) {}

  @override
  Widget defaultBody(BuildContext context) {
    return Obx(
      () => Column(
        children: [],
      ),
    );
  }
}
