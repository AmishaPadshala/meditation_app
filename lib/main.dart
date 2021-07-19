import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meditation app',
        theme: ThemeData(
            fontFamily: "Cairo",
            scaffoldBackgroundColor: kBackgroundColor,
            textTheme: Theme.of(context)
                .textTheme
                .apply(bodyColor: kTextColor, displayColor: kTextColor)),
        home: HomeScreen());
  }
}
