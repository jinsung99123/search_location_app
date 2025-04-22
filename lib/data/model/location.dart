class Location {
  String title;
  String link;
  String category;
  String description;
  String telephone;
  String address;
  String roadAddress;
  String mapx;
  String mapy;

  Location({
    required this.title,
    required this.link,
    required this.category,
    required this.description,
    required this.telephone,
    required this.address,
    required this.roadAddress,
    required this.mapx,
    required this.mapy,
  });

  // 1. fromJson 네임드 생성자 만들기
  Location.fromJson(Map<String, dynamic> map)
    : title = _removeHtmlTags(map['title']),
      link = _removeHtmlTags(map['link']),
      category = _removeHtmlTags(map['category']),
      description = _removeHtmlTags(map['description']),
      telephone = _removeHtmlTags(map['telephone']),
      address = _removeHtmlTags(map['address']),
      roadAddress = _removeHtmlTags(map['roadAddress']),
      mapx = map['mapx'],
      mapy = map['mapy'];
  static String _removeHtmlTags(String text) {
    final regExp = RegExp(r'<.*?>');
    return text.replaceAll(regExp, '');
  }

  // 2. toJson 메서드 만들기기
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'category': category,
      'description': description,
      'telephone': telephone,
      'address': address,
      'roadAddress': roadAddress,
      'mapx': mapx,
      'mapy': mapy,
    };
  }
}
