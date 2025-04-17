import 'dart:convert';

import 'package:http/http.dart';
import 'package:search_location_app/data/model/location.dart';

class LocationRepository {
  Future<List<Location>> searchLocations(String query) async {
    final client = Client();
    final response = await client.get(Uri.parse('https://openapi.naver.com/v1/search/local.json?query=$query'),
    headers: {
      'X-Naver-Client-Id':'G1GndP_yMBrLROhyU7gO',
      'X-Naver-Client-Secret':'hMvXynvwAW'
    });

    // get 요청 시 성공 => 200
    // 응답코드가 200일 때 body 데이터를 jsonDecode 함수 사용해서 map으로 바꾼후 List<location>로 반환
    if(response.statusCode ==200) {
      Map<String,dynamic> map= jsonDecode(response.body);
      final items = List.from(map['items']);

      // MappedIterable 이라는 클래스에 함수를 넘겨줄테니
      // 나중에 요청하면 ,그때 List(items)들을 하나씩 반복문을 돌면서 내가 넘겨준 함수를 실행시켜서서 새로운 리스트로 돌려줘

      final iterable = items.map((e) {
        return Location.fromJson(e);
      });
      final list = iterable.toList();
      return list;
    }
    // 아닐 때 빈 리스트 반환
    return [];
  }
}