import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_location_app/ui/pages/home_page/home_view_model.dart';

void main () {
  test('HomeViewModel Test', () async {
    final providerContainer = ProviderContainer();
    addTearDown(providerContainer.dispose);
    final homeVm = providerContainer.read(homeViewModelProvider.notifier);

    final firstState = providerContainer.read(homeViewModelProvider);
    expect(firstState.locations.isEmpty, true);

    await homeVm.searchLocations('harry');
    final afterState = providerContainer.read(homeViewModelProvider);
    expect(afterState.locations.isEmpty, false);

    afterState.locations.forEach((element) {
      print(element.toJson());
    },);

  });
}