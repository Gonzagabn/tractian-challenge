import 'dart:convert';

CompanyModel companyModelFromJson(String str) =>
    CompanyModel.fromJson(json.decode(str));

class CompanyModel {
  final List<Company> items;

  CompanyModel({
    this.items = const [],
  });

  factory CompanyModel.fromJson(List<dynamic> jsonList) => CompanyModel(
        items: List<Company>.from(
          jsonList.map(
            (company) => Company.fromJson(company),
          ),
        ),
      );
}

class Company {
  String id;
  String name;

  Company({
    required this.id,
    required this.name,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
      );

  factory Company.fromQueryParameters(Map<String, dynamic> queryParameters) =>
      Company(
        id: queryParameters["id"],
        name: queryParameters["name"],
      );

  Map<String, String> toQueryParameters() => {
        "id": id,
        "name": name,
      };
}
