import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'mobile_model.dart';

class MobileInfoScreen extends StatelessWidget {
  var mobileName, mobileUrl, mobileDetails;

  MobileInfoScreen(
      {Key? key,
      required this.mobileName,
      required this.mobileUrl,
      required this.mobileDetails})
      : super(key: key);

  //final String mobileName1 = mobileName;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(mobileName),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      children: [
                        Image.network(mobileUrl),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      children: [Html(data: mobileDetails)],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
