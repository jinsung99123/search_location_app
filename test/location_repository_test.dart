import 'package:flutter_test/flutter_test.dart';
import 'package:search_location_app/data/repository/location_repository.dart';

void main() {
  test('Location Repository Test', () async {
    LocationRepository locationRepository = LocationRepository();
    final locations = await locationRepository.searchLocations('harry');
    expect(locations.isEmpty,false);
    for (var location in locations) {
      print(location.toJson());
      
    }
  });
}