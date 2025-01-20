import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tractian_challenge/app/core/router/router.dart';
import 'package:tractian_challenge/app/domain/models/company.dart';
import 'package:tractian_challenge/app/presentation/screens/home/home_controller.dart';
import 'package:tractian_challenge/app/presentation/widgets/loading_container.dart';
import 'package:tractian_challenge/app/utils/constants/icons.dart';
import 'package:tractian_challenge/app/utils/constants/images.dart';
import 'package:tractian_challenge/app/utils/resources/spacing.dart';
import 'package:tractian_challenge/app/utils/themes/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;
  late ScrollController scrollController;

  @override
  void initState() {
    controller = Get.find<HomeController>();
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Image.asset(
          AppImages.tractianLogo,
          height: SpacingValue.xs,
        ),
        backgroundColor: AppColors.darkBlue,
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () => controller.onRefresh(),
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
                  child: Obx(
                    () => ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      separatorBuilder: (context, index) => VerticalSpacing.sm,
                      itemCount: controller.loadingData.value
                          ? 4
                          : controller.companies.value.items.length,
                      itemBuilder: (context, index) {
                        if (controller.loadingData.value) {
                          return LoadingContainer(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: SpacingValue.sm,
                                horizontal: SpacingValue.md,
                              ),
                              child: Text(
                                "-",
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          );
                        }

                        final Company company =
                            controller.companies.value.items[index];

                        return GestureDetector(
                          onTap: () => context.pushNamed(
                            RouteNames.assets,
                            queryParameters: company.toQueryParameters(),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: SpacingValue.sm,
                              horizontal: SpacingValue.md,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius:
                                  BorderRadius.circular(SpacingValue.xxxs),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppIcons.companyAssets,
                                  height: SpacingValue.sm,
                                ),
                                HorizontalSpacing.xs,
                                Text(
                                  "${company.name} Unit",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
