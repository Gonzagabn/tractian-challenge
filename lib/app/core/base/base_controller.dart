import 'package:get/get.dart';

enum AppScreenState { loading, success }

abstract class BaseController extends GetxController {
  final Rx<AppScreenState> _state = AppScreenState.success.obs;

  bool loading() => _state.value == AppScreenState.loading;
  bool success() => _state.value == AppScreenState.success;

  void changeState(AppScreenState state) => _state.value = state;

  final RxBool emptyData = true.obs;
  final RxBool loadingData = true.obs;
}
