import 'dart:convert';

import 'package:tractian_challenge/app/core/base/base_repository.dart';

interface class ICompaniesRepository {
  Future<List<dynamic>> getCompanies() async => [];
}

final class CompaniesRepository extends IBaseRepository
    implements ICompaniesRepository {
  CompaniesRepository({required super.client});

  @override
  Future<List<dynamic>> getCompanies() async {
    try {
      final String data = await client.get(
        url: "https://fake-api.tractian.com/companies",
      );

      return jsonDecode(data);
    } catch (error) {
      throw Exception('CompaniesRepository: getCompanies $error');
    }
  }
}
