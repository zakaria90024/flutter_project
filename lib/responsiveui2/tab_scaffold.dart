import 'package:flutter/material.dart';
import 'package:test_flutter_project/responsiveui2/utils/my_box.dart';
import 'package:test_flutter_project/responsiveui2/utils/my_tile.dart';

import 'utils/constaints.dart';

class TabScaffold extends StatefulWidget {
  const TabScaffold({Key? key}) : super(key: key);

  @override
  State<TabScaffold> createState() => _TabScaffoldState();
}

class _TabScaffoldState extends State<TabScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultbackGround,
      drawer: myDrawer,
      body: Column(
        children: [
          //4 box in top tile
          AspectRatio(
            aspectRatio: 4,
            child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return MyBox;
                    })),
          ),
          //end 4box
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return MyTile();
              },
            ),
          )
        ],
      ),
    );
  }
}
