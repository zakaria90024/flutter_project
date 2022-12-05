import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'mobile_model.dart';

class MobileInfoScreen extends StatelessWidget {

  var mobileName = "", mobileUrl = "", mobileDetails = "";

  MobileInfoScreen(
      {Key? key,
      required this.mobileName,
      required this.mobileUrl,
      required this.mobileDetails})
      : super(key: key);

  //final String mobileName1 = mobileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mobileName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(mobileUrl),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(mobileName),
                ), // Text), // Padding
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Html(data: mobileDetails))
              ], // Text
            ),
          ),
        ),
      ),
    );
  }
}
