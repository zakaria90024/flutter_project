import 'package:flutter/material.dart';
import 'package:test_flutter_project/responsiveui2/utils/my_box.dart';
import 'package:test_flutter_project/responsiveui2/utils/my_tile.dart';
import 'utils/constaints.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: myAppBar,
      backgroundColor: myDefaultbackGround,
      drawer: myDrawer,
      body: Row(
        children: [
          myDrawer,
          Expanded(
            flex: 4,
            child: Column(
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
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
