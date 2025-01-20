import 'package:tractian_challenge/app/data/repositories/locations_repository.dart';
import 'package:tractian_challenge/app/domain/models/location.dart';

interface class ILocationsUseCase {
  Future<LocationModel> getLocations(String companyId) async => LocationModel();
}

class LocationsUseCase implements ILocationsUseCase {
  final ILocationsRepository locationsRepository;

  LocationsUseCase({
    required this.locationsRepository,
  });

  @override
  Future<LocationModel> getLocations(String companyId) async {
    try {
      final List<dynamic> response =
          await locationsRepository.getLocations(companyId);

      return LocationModel.fromJson(response);
    } catch (error) {
      throw Exception('LocationsUseCase: getLocations $error');
    }
  }
}
