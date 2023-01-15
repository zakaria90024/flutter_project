import 'package:flutter/material.dart';
import 'package:test_flutter_project/responsiveui/responsive_layout.dart';
import 'package:test_flutter_project/responsiveui2/desktop_scaffold.dart';
import 'package:test_flutter_project/responsiveui2/mobile_scaffold.dart';
import 'package:test_flutter_project/responsiveui2/responsive_layout.dart';
import 'package:test_flutter_project/responsiveui2/tab_scaffold.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout1(
        mobileScaffold: MobileScaffold(),
        tabScaffold: TabScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
    );
  }
}
