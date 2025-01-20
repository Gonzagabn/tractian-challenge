import 'dart:convert';

import 'package:tractian_challenge/app/core/base/base_repository.dart';

interface class ILocationsRepository {
  Future<List<dynamic>> getLocations(String companyId) async => [];
}

final class LocationsRepository extends IBaseRepository
    implements ILocationsRepository {
  LocationsRepository({required super.client});

  @override
  Future<List<dynamic>> getLocations(String companyId) async {
    try {
      final String data = await client.get(
        url: "https://fake-api.tractian.com/companies/$companyId/locations",
      );

      return jsonDecode(data);
    } catch (error) {
      throw Exception('LocationsRepository: getLocations $error');
    }
  }
}
