import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:test_flutter_project/mobile_model.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/material.dart';

void search() {
  runApp(const MySearch());
}

class MySearch extends StatelessWidget {
  const MySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MobileModel> main_mobiles_list = [
    MobileModel("1", "Xiaomi", "200", "mobileImageUrl", "dsdf"),
    MobileModel("2", "Redmi", "365", "mobileImageUrl2", "sdfds"),
    MobileModel("3", "Viv", "655", "mobileImageUrl3", "sdfdsf"),
    MobileModel("4", "Samsung", "654", "mobileImageUrl4", "sdfsdf"),
    MobileModel("4", "Nokia", "677", "mobileImageUrl4", "sdfdsf"),
    MobileModel("4", "MacOS", "677", "mobileImageUrl4", "sdfdsf"),
    MobileModel("4", "Iphone", "677", "mobileImageUrl4", "sdfdsf"),
    MobileModel("4", "iphone", "677", "mobileImageUrl4", "sdfdsf"),
    MobileModel("4", "Windows", "677", "mobileImageUrl4", "sdfdsf"),
    MobileModel("4", "Walton", "677", "mobileImageUrl4", "sdfdsf"),
    MobileModel("4", "Google Pixel", "677", "mobileImageUrl4", "sdfdsf"),
  ];
  List<MobileModel> new_mobile = List.from(main_mobiles_list);

  void updateList(String value) {
    setState(() {
      new_mobile = main_mobiles_list
          .where((element) =>
              element.mobileName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search for a movie",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              decoration: const InputDecoration(
                hintText: "eg: The Dark Knight",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Color(0xffff0000),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.greenAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color:Colors.blue),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromARGB(255, 66, 125, 145)),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: new_mobile.isEmpty
                  ? const Center(
                      child: Text(
                        "Now Result Found",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    )
                  : ListView.builder(
                      itemCount: new_mobile.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          "${new_mobile[index].mobileName}",
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('${new_mobile[index].mobileImageUrl}'),
                        trailing: Text('${new_mobile[index].mobilePrice}'),
                        //leading: Image.network(new_mobile[index].mobileImageUrl!),
                      ),
                    ),
            ),
          ],

        ),
      ),

    );
  }

  Future<List<MobileModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonFile/mobilehut.json');
    final list = jsonDecode(jsondata) as List<dynamic>;
    return list.map((e) => MobileModel.fromJson(e)).toList();
  }
}
