import 'package:flutter/material.dart';
import 'package:test_flutter_project/responsiveui2/utils/constaints.dart';
import 'package:test_flutter_project/responsiveui2/utils/my_box.dart';
import 'package:test_flutter_project/responsiveui2/utils/my_tile.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
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
            aspectRatio: 1,
            child: SizedBox(
                width: double.infinity,
                child: GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
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
