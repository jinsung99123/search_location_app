import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_location_app/data/model/location.dart';
import 'package:search_location_app/ui/pages/home_page/home_view_model.dart';

class HomePage extends ConsumerStatefulWidget {

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void onSearch(String text){
    print('onSearch 호출됌');
    ref.read(homeViewModelProvider.notifier).searchLocations(text);
  }

  @override
  Widget build(BuildContext context) {
    
    final homeState = ref.watch(homeViewModelProvider);


    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 228, 245),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 250, 228, 245),
          title: TextField(
            maxLines: 1,
            controller: textEditingController,
            onSubmitted: onSearch,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
            
          )),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemCount: homeState.locations.length,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              final location = homeState.locations[index];
              return item(location);
            },
          ),
        ),
      ),
    );
  }

  Container item(Location location) => Container(
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
            location.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(location.category),
          Text(location.address),
        ],
      ),
    ),
  );
}
