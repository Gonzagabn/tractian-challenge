import 'package:tractian_challenge/app/core/base/base_repository.dart';

interface class ICompaniesRepository {
  Future<Map<String, dynamic>?> getCompanies() async => null;
}

final class CompaniesRepository extends IBaseRepository
    implements ICompaniesRepository {
  CompaniesRepository({required super.client});

  @override
  Future<Map<String, dynamic>?> getCompanies() async {
    try {
      final Map<String, dynamic>? data = {};
      return data;
    } catch (error) {
      throw Exception('CompaniesRepository: getCompanies $error');
    }
  }
}
