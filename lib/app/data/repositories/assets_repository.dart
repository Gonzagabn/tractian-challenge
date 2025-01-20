import 'dart:convert';

import 'package:tractian_challenge/app/core/base/base_repository.dart';

interface class IAssetsRepository {
  Future<List<dynamic>> getAssets(String companyId) async => [];
}

final class AssetsRepository extends IBaseRepository
    implements IAssetsRepository {
  AssetsRepository({required super.client});

  @override
  Future<List<dynamic>> getAssets(String companyId) async {
    try {
      final String data = await client.get(
        url: "https://fake-api.tractian.com/companies/$companyId/assets",
      );

      return jsonDecode(data);
    } catch (error) {
      throw Exception('AssetsRepository: getAssets $error');
    }
  }
}
