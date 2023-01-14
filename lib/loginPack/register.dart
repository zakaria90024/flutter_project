import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: deviceHight * 0.10,
                child: Image.asset('assets/images/burger.jpg'),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFF).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16)
                ),
              ),
              Container(
                child: Text("Burger Style", style: TextStyle(fontWeight: FontWeight.bold),)
              )
            ],
          ),
        ),
      ),


    );

  }
}
