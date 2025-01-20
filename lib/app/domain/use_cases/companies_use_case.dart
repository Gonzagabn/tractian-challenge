import 'package:tractian_challenge/app/data/repositories/companies_repository.dart';
import 'package:tractian_challenge/app/domain/models/company.dart';

interface class ICompaniesUseCase {
  Future<CompanyModel> getCompanies() async => CompanyModel();
}

class CompaniesUseCase implements ICompaniesUseCase {
  final ICompaniesRepository companiesRepository;

  CompaniesUseCase({
    required this.companiesRepository,
  });

  @override
  Future<CompanyModel> getCompanies() async {
    try {
      final Map<String, dynamic>? response =
          await companiesRepository.getCompanies();

      return CompanyModel.fromJson([response]);
    } catch (error) {
      throw Exception('CompaniesUseCase: getCompanies $error');
    }
  }
}
