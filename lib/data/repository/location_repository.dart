import 'package:dio/dio.dart';
import 'package:search_location_app/data/model/location.dart';

class LocationRepository {
  final Dio dio;

  LocationRepository({Dio? dio}) : dio = dio ?? Dio();

  Future<List<Location>> searchLocations(String query) async {
    try {
      final response = await dio.get(
        'https://openapi.naver.com/v1/search/local.json',
        queryParameters: {'query': query, 'display': '5'},
        options: Options(
          headers: {
            'X-Naver-Client-Id': 'G1GndP_yMBrLROhyU7gO',
            'X-Naver-Client-Secret': 'hMvXynvwAW',
          },
        ),
      );
      // 200 OK 응답일 때 처리
      if (response.statusCode == 200) {
        final Map<String, dynamic> map = response.data;
        final items = List.from(map['items']);
        // MappedIterable을 사용하여 Location 객체로 변환
        final iterable = items.map((e) => Location.fromJson(e));
        final list = iterable.toList();
        return list;
      }
    } catch (e) {
      print('Error occurred: $e');
    }
    return [];
  }
}