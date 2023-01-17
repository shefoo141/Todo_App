import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Home/screens/taskList/taskItem.dart';

class taskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
       children: [
         CalendarTimeline(
           initialDate: DateTime.now(),
           firstDate: DateTime.now(),
           lastDate: DateTime.now().add(Duration(days: 365)),
           onDateSelected: (date) => print(date),
           leftMargin: 20,
           monthColor: Colors.blueGrey,
           dayColor: Colors.teal[200],
           activeDayColor: Colors.white,
           activeBackgroundDayColor: Colors.redAccent[100],
           dotsColor: Color(0xFF333A47),
           selectableDayPredicate: (date) => true,
           locale: 'en_ISO',
         ),
         Expanded(child: ListView.builder(itemBuilder: (context, index) => taskItem())),
       ],
     ),
    );
  }
}
