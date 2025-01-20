import 'package:get/get.dart';
import 'package:tractian_challenge/app/core/base/base_controller.dart';
import 'package:tractian_challenge/app/domain/models/asset.dart';
import 'package:tractian_challenge/app/domain/use_cases/assets_use_case.dart';

class AssetsController extends BaseController {
  final IAssetsUseCase assetsUseCase;

  AssetsController({required this.assetsUseCase});

  final Rx<AssetModel> assets = AssetModel().obs;

  @override
  void onInit() {
    getAssets();
    super.onInit();
  }

  void onRefresh() => getAssets();

  Future<dynamic> getAssets() async {
    try {
      loadingData.value = true;
      await assetsUseCase.getAssets().then((data) => assets.value = data);
    } catch (error) {
      throw Exception('AssetsController: getAssets $error');
    } finally {
      if (assets.value.items.isNotEmpty) emptyData.value = false;
      loadingData.value = false;
    }
  }
}
