import 'package:flutter/material.dart';
class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        title: const Center(child: Text("D E S K T O P")),
      ),
      body: Row(
        children: [
          //first column
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AspectRatio(
                        aspectRatio: 16 / 8,
                        child: Container(
                          height: 180,
                          color: Colors.lightBlue[700],
                        ),
                      )),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.lightBlue[700],
                                height: 120,
                              ),
                            );
                          })
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              color: Colors.lightBlue[300],
            ),
          )
        ],
      ),
    );
  }
}
