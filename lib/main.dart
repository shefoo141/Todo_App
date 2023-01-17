import 'package:flutter/material.dart';
import 'package:todo_app/Home/homeScreen.dart';
import 'package:todo_app/appStyle/themes.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        "Home":(context) => homeScreen(),
      },
      initialRoute: "Home",
      themeMode: ThemeMode.light  ,
      theme:myThemes.lightTheme,
      darkTheme: myThemes.darkTheme,

    );
  }
}
