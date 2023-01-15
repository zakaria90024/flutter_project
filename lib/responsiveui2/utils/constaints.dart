import 'package:flutter/material.dart';

var myDefaultbackGround = Colors.white;

var myAppBar = AppBar(
  backgroundColor: Colors.black,
);

var myDrawer = Drawer(
  backgroundColor: Colors.white,
  child: Column(
    children: [
      DrawerHeader(child: Icon(Icons.account_circle_outlined)),
      ListTile(
        leading: Icon(Icons.home),
        title: Text("Home"),
        textColor: Colors.black,
        tileColor: Colors.white,
      ),
      ListTile(
        leading: Icon(Icons.message),
        title: Text("Message"),
        textColor: Colors.black,
        tileColor: Colors.white,
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text("Logout"),
        textColor: Colors.black,
        tileColor: Colors.white,
      )
    ],
  ),
);

