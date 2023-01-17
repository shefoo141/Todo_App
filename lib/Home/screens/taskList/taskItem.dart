import 'package:flutter/material.dart';
import 'package:todo_app/appStyle/colors.dart';

class taskItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 50,
            color: lightPrimaryColor,
          ),
         SizedBox(width: 15,),
         Expanded(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Task Title", style: Theme.of(context)
                   .textTheme.headline4?.copyWith
                 (color: lightPrimaryColor , fontWeight:FontWeight.bold),),
               Text("Task Description",style: Theme.of(context).textTheme.headline6),
             ],
           ),
         ),
         GestureDetector(
           onTap: (){},
           child: Container(
             decoration: BoxDecoration(
               color: lightPrimaryColor,
               borderRadius: BorderRadius.circular(10),
             ),
             width: 60,
             height: 50,
             child: Icon(Icons.done , color: Colors.white, size: 40,),
           ),
         )
        ],
      ),
    );

  }
}
