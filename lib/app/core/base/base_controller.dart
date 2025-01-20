import 'package:get/get.dart';

enum AppScreenState { loading, success }

abstract class BaseController extends GetxController {
  final RxBool loadingData = true.obs;
}
