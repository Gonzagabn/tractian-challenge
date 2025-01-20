import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:tractian_challenge/app/core/base/base_controller.dart';
import 'package:tractian_challenge/app/utils/resources/screen_size.dart';

abstract class BaseStatelessScreen<T extends BaseController>
    extends StatelessWidget {
  final T controller;
  final bool removeAppBar;
  final bool showAppBarLeadingButton;
  final bool removeScrollBehavior;

  const BaseStatelessScreen({
    required this.controller,
    this.removeAppBar = false,
    this.showAppBarLeadingButton = true,
    this.removeScrollBehavior = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        () => onBackAction(context, controller);
      },
      child: Scaffold(
        backgroundColor: screenBackgroundColor(),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
        appBar: removeAppBar ? null : appBar(context, controller),
        body: Stack(
          children: [
            removeScrollBehavior
                ? Padding(
                    padding: screenPadding(controller),
                    child: defaultBody(context),
                  )
                : RefreshIndicator(
                    onRefresh: () => onRefresh(),
                    color: refreshColor(),
                    backgroundColor: refreshBackgroundColor(),
                    child: Scrollbar(
                      controller: customScrollController(controller) ??
                          scrollController,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: customScrollController(controller) ??
                            scrollController,
                        physics: scrollPhysics(),
                        child: Padding(
                          padding: screenPadding(controller),
                          child: defaultBody(context),
                        ),
                      ),
                    ),
                  ),
            Obx(
              () => Visibility(
                visible: controller.loading(),
                child: loadingView(context),
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomNavigationBar(context),
      ),
    );
  }

  void onBackAction(BuildContext context, T controller) {
    context.pop();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Get.isRegistered<T>()) Get.delete<T>();
    });
  }

  Color? screenBackgroundColor() => Colors.grey[100];

  bool? resizeToAvoidBottomInset() => null;

  PreferredSizeWidget appBar(BuildContext context, T controller) {
    final double statusBarHeight = ScreenSize.paddingTop;
    return PreferredSize(
      preferredSize: Size.fromHeight(64.0 + statusBarHeight),
      child: Container(
        height: 64.0 + statusBarHeight,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              spreadRadius: 4.8,
            )
          ],
        ),
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Stack(
          children: [
            Row(
              children: [
                showAppBarLeadingButton
                    ? appBarLeading(context, controller)
                    : const SizedBox.shrink(),
                appBarTitle(controller).isNotEmpty
                    ? Container(
                        padding: EdgeInsets.only(
                            left: showAppBarLeadingButton ? 8.0 : 16.0),
                        child: Center(
                          child: Text(
                            appBarTitle(controller),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: Icon(
                appBarIconData(controller),
                size: 48.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBarIconButton(
      {required void Function()? action, IconData? iconData}) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        color: Colors.transparent,
        child: Icon(iconData, color: Colors.white),
      ),
    );
  }

  Widget appBarLeading(BuildContext context, T controller) {
    return appBarIconButton(
        action: () => appBarLeadingAction(context, controller),
        iconData: appBarLeadingIcon());
  }

  Widget appBarTrailing(BuildContext context, T controller) {
    return appBarIconButton(
        action: () => appBarTrailingAction(context, controller),
        iconData: appBarTrailingIcon());
  }

  IconData? appBarLeadingIcon() => Icons.arrow_back;

  IconData? appBarTrailingIcon() => null;

  IconData? appBarIconData(T controller) => null;

  void appBarLeadingAction(BuildContext context, T controller) =>
      onBackAction(context, controller);

  void appBarTrailingAction(BuildContext context, T controller) {}

  String appBarTitle(T controller) => '';

  PreferredSizeWidget defaultAppBar(BuildContext context) => AppBar();

  Future<void> onRefresh() async {}
  Color? refreshColor() => null;
  Color? refreshBackgroundColor() => null;

  ScrollController? customScrollController(T controller) => null;
  ScrollPhysics? scrollPhysics() =>
      const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics());

  EdgeInsetsGeometry screenPadding(T controller) {
    return EdgeInsets.only(
      left: 8.0,
      right: 12.0,
      bottom: 16.0,
    );
  }

  Widget defaultBody(BuildContext context);

  Widget loadingView(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.48),
      child: Center(
          child: CircularProgressIndicator(
        strokeWidth: 2.0,
        color: Colors.grey[100],
      )),
    );
  }

  Widget? bottomNavigationBar(BuildContext context) => null;
}
