import 'package:flutter/material.dart';
import 'package:todo_app/Home/screens/settings/languageSheet.dart';
import 'package:todo_app/Home/screens/settings/themeSheet.dart';
import 'package:todo_app/appStyle/colors.dart';

class settingScreen extends StatefulWidget {

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Language", style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 10,),
             InkWell(
               onTap: () {
                 languageSheet(context);
               },
               child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: lightPrimaryColor,
                      width: 2,
                    )
                ),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("English", style: Theme.of(context).textTheme.headline3,),
                    Spacer(),
                    Icon(Icons.arrow_drop_down,color: Colors.black,),
                  ],
                ),
            ),
             ),
            SizedBox(height: 25,),
            Text("Theme",style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 10,),
            InkWell(
              onTap: (){
                themeSheet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: lightPrimaryColor,
                      width: 2,
                    )
                ),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("light",style: Theme.of(context).textTheme.headline3,),
                    Spacer(),
                    Icon(Icons.arrow_drop_down, color: Colors.black,),
                  ],
                ),
              ),
            ),
          ],
      ),
    );
  }

  void languageSheet(BuildContext context) {
    showModalBottomSheet(context: context ,  builder: (context){
      return languageBottomSheet();
    });
  }

  void themeSheet(BuildContext context) {
    showModalBottomSheet(context: context ,  builder: (context){
      return themeBottomSheet();
    });
  }
}