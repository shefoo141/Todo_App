import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Home/screens/taskList/taskItem.dart';

import '../../../dataBase/dataBase_config.dart';
import '../../../models/taskDM.dart';

class taskScreen extends StatefulWidget {

  @override
  State<taskScreen> createState() => _taskScreenState();
}

class _taskScreenState extends State<taskScreen> {
  DateTime chosenDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
       children: [
         CalendarTimeline(
           initialDate: chosenDate,
           firstDate: DateTime.now().subtract(Duration(days: 365)),
           lastDate: DateTime.now().add(Duration(days: 365)),
           onDateSelected: (date) {
             chosenDate=date;
             setState(() {

             });
           },

           leftMargin: 20,
           monthColor: Colors.blueGrey,
           dayColor: Colors.teal[200],
           activeDayColor: Colors.white,
           activeBackgroundDayColor: Colors.redAccent[100],
           dotsColor: Color(0xFF333A47),
           selectableDayPredicate: (date) => true,
           locale: 'en_ISO',
         ),
         StreamBuilder<QuerySnapshot<task>>
           ( stream: getTasks(chosenDate),
             builder:(context, snapshot){
             if (snapshot.connectionState== ConnectionState.waiting){
               return Center(child: CircularProgressIndicator());
             }
             else if(snapshot.hasError){
               return Center(child: Text('SomeThing Went Wrong..'));
             }
             else{
               List<task>Tasks=snapshot.data?.docs.map((e) => e.data()).toList()??[];
               return Expanded(
                 child: ListView.separated(
                   separatorBuilder: (context,index)=>SizedBox(height: 10,),
                   itemCount: Tasks.length,
                     itemBuilder:(context,index) => taskItem(Tasks[index])),
               );
             }
             }
         )

       ],
     ),
    );
  }
}
