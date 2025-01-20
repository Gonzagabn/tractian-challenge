import 'package:get/get.dart';
import 'package:tractian_challenge/app/core/base/base_controller.dart';
import 'package:tractian_challenge/app/domain/models/company.dart';
import 'package:tractian_challenge/app/domain/use_cases/companies_use_case.dart';

class HomeController extends BaseController {
  final ICompaniesUseCase companiesUseCase;

  HomeController({required this.companiesUseCase});

  final Rx<CompanyModel> companies = CompanyModel().obs;

  @override
  void onInit() {
    getCompanies();
    super.onInit();
  }

  Future<void> onRefresh() async => await getCompanies();

  Future<void> getCompanies() async {
    try {
      loadingData.value = true;
      await companiesUseCase
          .getCompanies()
          .then((data) => companies.value = data);
    } catch (error) {
      throw Exception('CompaniesController: getCompanies $error');
    } finally {
      loadingData.value = false;
    }
  }
}
