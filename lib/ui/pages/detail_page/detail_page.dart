import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar'),
        backgroundColor: const Color.fromARGB(255, 250, 228, 245),
      ),
      body: Text('DetailPage'),
    );
  }
}