import 'package:tractian_challenge/app/core/base/base_repository.dart';

interface class ILocationsRepository {
  Future<Map<String, dynamic>?> getLocations() async => null;
}

final class LocationsRepository extends IBaseRepository
    implements ILocationsRepository {
  LocationsRepository({required super.client});

  @override
  Future<Map<String, dynamic>?> getLocations() async {
    try {
      final Map<String, dynamic>? data = {};
      return data;
    } catch (error) {
      throw Exception('LocationsRepository: getLocations $error');
    }
  }
}
