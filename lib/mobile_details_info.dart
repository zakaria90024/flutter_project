import 'package:flutter/material.dart';
import 'mobile_model.dart';

class MobileInfoScreen extends StatelessWidget {
  var mobileName, mobileUrl, mobileDetails;

  MobileInfoScreen(
      {Key? key, required this.mobileName, required this.mobileUrl, required this.mobileDetails})
      : super(key: key);

  //final String mobileName1 = mobileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mobileName + mobileUrl),
      ),
    );
  }
}