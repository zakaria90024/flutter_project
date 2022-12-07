import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviveWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: deviceHeight * 0.30,
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: FittedBox(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/burger.jpg',
                    ),
                    radius: 120,
                  ),
                ),
              ),
            ),
            Container(
              height: deviceHeight * 0.60,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: LayoutBuilder(
                builder: (ctx, constrains) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login Now',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: constrains.maxHeight * 0.02),
                      const Text("Please Enter the details below to continue"),
                      SizedBox(height: constrains.maxHeight * 0.08),
                      Container(
                        height: constrains.maxHeight * 0.12,
                        decoration: BoxDecoration(
                            color: Color(0xffB4B4B4).withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "zaka@gmislf.com",
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constrains.maxHeight * 0.02,
                      ),
                      Container(
                        height: constrains.maxHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffB4B4B4).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Center(
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.visibility,
                                        color: Colors.grey,
                                      )),
                                  border: InputBorder.none,
                                  hintText: 'Password'),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forget Password',
                                style: TextStyle(color: Color(0xffB4B4B4)),
                              ))
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: constrains.maxHeight * 0.12,
                        margin:
                            EdgeInsets.only(top: constrains.maxHeight * 0.05),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffff0606),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: constrains.maxHeight * 0.08,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Don\'t hava an account?',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                            children: [
                              TextSpan(
                                  text: 'Register',
                                  style: TextStyle(
                                      color: Color(0xffB4B4B4), fontSize: 18),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})
                            ]),
                      ),
                      SizedBox(
                        height: constrains.maxHeight * 0.02,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
