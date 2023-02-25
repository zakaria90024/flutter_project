import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_project/mobile_model.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:test_flutter_project/responsiveui/homepage.dart';
import 'package:test_flutter_project/responsiveui2/home_page.dart';
import 'package:test_flutter_project/search.dart';
import 'package:test_flutter_project/sqlFlite/sqlite_crud.dart';
import 'loginPack/login.dart';
import 'loginPack/register.dart';
import 'mobile_details_info.dart';
import 'mobile_model.dart';
import 'mysqlDatatable/DataTableDemo.dart';

void main() {
  runApp(const MyApp());
  //for call any activity
  //runApp(MobileInfoScreen(mobileDetails: "", mobileName: "", mobileUrl: ""));
  // runApp(MaterialApp(
  //   //home: loginScreen(),
  //   home: RegisterPage(),
  // ));
  // runApp(MaterialApp(
  //   //home: loginScreen(),
  //   home: HomePage(),
  // ));

  // runApp(MaterialApp(
  //   //home: loginScreen(),
  //   home: loginScreen(),
  // ));

  // runApp(MaterialApp(
  //   //home: loginScreen(),
  //   home: HomePage1(),
  // ));

  //runApp(const HomePage1());

  //runApp(const MySearch());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Smartphones - 2023'),
      home: DBTestPage(title: 'dfs',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearch());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: FutureBuilder(
                future: ReadJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(
                      child: Text("${data.error}"),
                    );
                  } else if (data.hasData) {
                    var items = data.data as List<MobileModel>;
                    return ListView.builder(itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MobileInfoScreen(
                                        mobileName: items[index].mobileName,
                                        mobileUrl: items[index].mobileImageUrl,
                                        mobileDetails:
                                            items[index].mobileDescription)));
                            Fluttertoast.showToast(
                                msg: items[index].id.toString(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 12.0);
                          },
                          child: Card(
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: 50,
                              height: 62,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image(
                                      image: NetworkImage(
                                          items[index].mobileImageUrl.toString()),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          padding: const EdgeInsets.only(bottom: 2),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: Text(
                                                  items[index].mobileName.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: Text(items[index]
                                                    .mobilePrice
                                                    .toString()),
                                              )
                                            ],
                                          )))
                                ],
                              ),
                            ),
                          ));
                    });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ));
  }

  Future<List<MobileModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonFile/mobilehut.json');
    final list = jsonDecode(jsondata) as List<dynamic>;
    return list.map((e) => MobileModel.fromJson(e)).toList();
  }
}

//for search add
class CustomSearch extends SearchDelegate {
  List<String> allMobileNameList = [
    'Samsung',
    'Nokia',
    'Xiaomi',
    'Redmi',
    'Hp',
    'Walton',
    'Windows'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allMobileNameList) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allMobileNameList) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
