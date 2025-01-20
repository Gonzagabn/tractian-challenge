import 'package:tractian_challenge/app/data/repositories/assets_repository.dart';
import 'package:tractian_challenge/app/domain/models/asset.dart';

interface class IAssetsUseCase {
  Future<AssetModel> getAssets(String companyId) async => AssetModel();
}

class AssetsUseCase implements IAssetsUseCase {
  final IAssetsRepository assetsRepository;

  AssetsUseCase({
    required this.assetsRepository,
  });

  @override
  Future<AssetModel> getAssets(String companyId) async {
    try {
      final List<dynamic> response =
          await assetsRepository.getAssets(companyId);

      return AssetModel.fromJson(response);
    } catch (error) {
      throw Exception('AssetsUseCase: getAssets $error');
    }
  }
}
