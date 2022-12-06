import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    final deviveHeight = MediaQuery.of(context).size.height;
    final deviveWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: deviveHeight * 0.30,
              child: FittedBox(
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/burger.jpg',
                  ),
                  radius: 120,
                ),
              ),
            ),
            Container(
              height: deviveHeight * 0.65,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(
                builder: (ctx, constrains) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login Now',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: constrains.maxHeight * 0.01),
                      Text("Please Enter the details below to continue"),
                      SizedBox(height: constrains.maxHeight * 0.08),
                      Container(
                        height: constrains.maxHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffB4B4B4).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "zaka@gmislf.com",
                              ) ,
                            ),
                          ),
                        ),

                      ),
                      SizedBox(
                        height: constrains.maxHeight * 0.02,
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
