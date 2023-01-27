import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home/homeScreen.dart';
import 'package:todo_app/Home/screens/taskList/editTasks.dart';
import 'package:todo_app/appStyle/themes.dart';
import 'package:todo_app/provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  //await FirebaseFirestore.instance.settings= Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => provider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late provider providerSettings;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    providerSettings = Provider.of(context);
    return  MaterialApp(
      routes: {
        "Home":(context) => homeScreen(),
        "upadteTask" :(context)=>editTaskSheet(),
      },
      initialRoute: "Home",
      themeMode: providerSettings.appThemeMode ,
      theme:myThemes.lightTheme,
      darkTheme: myThemes.darkTheme,

    );
  }
}
