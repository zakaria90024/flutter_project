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
    MobileModel("1", "mobileName1", "mobilePrice1", "mobileImageUrl"),
    MobileModel("2", "mobileName2", "mobilePrice2", "mobileImageUrl2"),
    MobileModel("3", "mobileName3", "mobilePrice3", "mobileImageUrl3")
  ];
  List<MobileModel> new_mobile = List.from(main_mobiles_list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a movie",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "eg: The Dark Knight",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Color(0xffff0000),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.greenAccent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xff818181)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromARGB(255, 66, 125, 145)),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: new_mobile.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text(
                    new_mobile[index].mobileName!,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${new_mobile[index].mobileImageUrl}'),
                  trailing: Text('${new_mobile[index].mobileName}'),
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
