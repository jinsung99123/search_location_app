import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:search_location_app/data/model/location.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.location);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
        backgroundColor: const Color.fromARGB(255, 250, 228, 245),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(location.link)
        ),
        initialSettings: InAppWebViewSettings(
          userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'
        ),
      ),
    );
  }
}
