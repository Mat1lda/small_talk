
import 'package:flutter/material.dart';
import 'package:small_talk/Screen/LoginScreen.dart';

import 'Screen/homePage.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
        //primarySwatch: Colors.green,
        //primaryColor: Color(0xFF075E54)
        //colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF075E54)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        popupMenuTheme: PopupMenuThemeData(
          color: Colors.white, // Background color of the popup menu
          // Text color of the popup menu items
        ),
        //colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF128C7E)),
      ),
      home: LoginScreen(),
    );
  }

}

