import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_location_app/data/model/location.dart';
import 'package:search_location_app/data/repository/location_repository.dart';
// 1. 상태 클래스 만들기

class HomeState {
  List<Location> locations;
  HomeState(this.locations);
}
// 2. 뷰모델 만들기 - Notifier 상속
class HomeViewModel extends Notifier<HomeState>{
  @override
  HomeState build() {
    return HomeState([]);
  }

  Future<void> searchLocations(String query) async{
    final locationRepository = LocationRepository(); 
    final locations = await locationRepository.searchLocations(query);
    state = HomeState(locations); }
} 
// 3. 뷰모델 관리자 만들기기 - NotifierProvider 객체

final homeViewModelProvider = NotifierProvider<HomeViewModel,HomeState>(() {
  return HomeViewModel();
});