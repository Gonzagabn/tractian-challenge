import 'dart:convert';

import 'package:tractian_challenge/app/domain/models/element.dart';

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

class Company extends ElementModel {
  Company({
    required super.id,
    required super.name,
    required super.type,
  });

  factory Company.empty() =>
      Company(id: "", name: "", type: ElementType.company);

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        type: ElementType.company,
      );

  factory Company.fromQueryParameters(Map<String, dynamic> queryParameters) =>
      Company(
        id: queryParameters["id"],
        name: queryParameters["name"],
        type: ElementType.company,
      );

  Map<String, String> toQueryParameters() => {
        "id": id,
        "name": name,
      };
}
