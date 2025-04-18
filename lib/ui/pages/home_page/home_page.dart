import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 228, 245),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 250, 228, 245),
          title: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
            
          )),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemCount: 5,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              return item();
            },
          ),
        ),
      ),
    );
  }

  Container item() => Container(
    width: double.infinity,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '삼성 1동 주민센터',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text('공공,사회기관>행정복지센터'),
          Text('서울특별시 강남구 봉은사로 616 삼성1동 주민센터'),
        ],
      ),
    ),
  );
}
