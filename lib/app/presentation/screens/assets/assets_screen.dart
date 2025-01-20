import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tractian_challenge/app/domain/models/company.dart';
import 'package:tractian_challenge/app/presentation/screens/assets/assets_controller.dart';
import 'package:tractian_challenge/app/utils/constants/icons.dart';
import 'package:tractian_challenge/app/utils/resources/spacing.dart';
import 'package:tractian_challenge/app/utils/themes/colors.dart';

class AssetsScreen extends StatefulWidget {
  final Map<String, dynamic> queryParameters;

  const AssetsScreen({
    super.key,
    required this.queryParameters,
  });

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  late AssetsController controller;
  late ScrollController scrollController;

  @override
  void initState() {
    controller = Get.find<AssetsController>();
    scrollController = ScrollController();
    controller.company.value =
        Company.fromQueryParameters(widget.queryParameters);
    controller.getData(controller.companyId);
    super.initState();
  }

  void onBackAction(BuildContext context, AssetsController controller,
      {bool didPop = true}) {
    if (didPop) context.pop();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Get.isRegistered<AssetsController>()) Get.delete<AssetsController>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        onBackAction(context, controller, didPop: false);
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => onBackAction(context, controller),
            child: Container(
              margin: const EdgeInsets.all(SpacingValue.xxs),
              padding: const EdgeInsets.all(SpacingValue.xxs),
              color: Colors.transparent,
              child: Image.asset(
                AppIcons.chevronLeft,
                color: AppColors.white,
              ),
            ),
          ),
          title: Text(
            "${controller.companyName} Assets",
            style: TextStyle(
              fontSize: 18.0,
              color: AppColors.white,
            ),
          ),
          backgroundColor: AppColors.darkBlue,
        ),
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async => controller.onRefresh(controller.companyId),
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics(),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SpacingValue.md,
                      horizontal: SpacingValue.sm,
                    ),
                    child: Text("algo aqui"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
