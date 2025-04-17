import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:search_location_app/data/model/location.dart';

void main() {
  test('location model test', () {
    String dummyData = """     
  
    {
      "title": "커피해리902",
      "link": "https://www.instagram.com/coffeeharry902",
      "category": "음식점>카페,디저트",
      "description": "",
      "telephone": "",
      "address": "인천광역시 서구 원당동 1030-8 검단퍼스트 112호",
      "roadAddress": "인천광역시 서구 이음5로 80 검단퍼스트 112호",
      "mapx": "1267163311",
      "mapy": "375953218"
    }

""";
    Map<String, dynamic> map = jsonDecode(dummyData);
    // 1. Map 으로 변환
    Location location = Location.fromJson(map);
    expect(location.category, '음식점>카페,디저트');
    print(location.toJson());
    // 2. 객체로 변환
  });
}
