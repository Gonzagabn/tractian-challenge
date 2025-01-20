import 'package:tractian_challenge/app/core/base/base_repository.dart';

interface class IAssetsRepository {
  Future<Map<String, dynamic>?> getAssets() async => null;
}

final class AssetsRepository extends IBaseRepository
    implements IAssetsRepository {
  AssetsRepository({required super.client});

  @override
  Future<Map<String, dynamic>?> getAssets() async {
    try {
      final Map<String, dynamic>? data = {};
      return data;
    } catch (error) {
      throw Exception('AssetsRepository: getAssets $error');
    }
  }
}
