import 'package:flutter/material.dart';
import 'package:test_flutter_project/responsiveui/desktop_body.dart';
import 'package:test_flutter_project/responsiveui/mobile_body.dart';
import 'package:test_flutter_project/responsiveui/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: currentWidth < 600? Colors.deepPurple[300] : Colors.green[300],
      // body: Center(
      //   child: Text(currentWidth.toString()),
      // ),
      body: const ResponsiveLayout(mobileBody: MyMobileBody(),desktopBody: MyDesktopBody(),),
    );
  }
}
