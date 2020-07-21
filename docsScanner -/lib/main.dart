import 'package:flutter/material.dart';
import 'package:docScanner/Screen/HomePage.dart';
import 'package:docScanner/Screen/OtpPage.dart';
import 'package:docScanner/Constant/Constant.dart';

void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//   home: new HomePage(),

//   debugShowCheckedModeBanner: false,
//     theme: new ThemeData(
//       primaryColorDark: Colors.brown,
//       primaryColor: Colors.blueAccent,
//     ),

//     routes: <String, WidgetBuilder>{
//       HOME_SCREEN: (BuildContext context) => new HomePage(),
//       OTP_SCREEN: (BuildContext context) => new OtpPage(),
//     },

// ))
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
          debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColorDark: Colors.brown,
      primaryColor: Colors.blueAccent,
    ),
    routes: {
      homescreen: (BuildContext context) => new HomePage(),
      otpscreen: (BuildContext context) => new OtpPage(),
    },
    );
  }
}

