import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/appStyle/colors.dart';
import 'package:todo_app/dataBase/dataBase_config.dart';
import 'package:todo_app/Home/screens/taskList/editTasks.dart';
import 'package:todo_app/models/taskDM.dart';

import '../../../models/taskDM.dart';

class taskItem extends StatefulWidget {
task TaskModel ;
taskItem(this.TaskModel);

  @override
  State<taskItem> createState() => _taskItemState();
}

class _taskItemState extends State<taskItem> {

   DateTime timeDate = DateTime.now();
@override
Widget build(BuildContext context) {
  return Slidable(
    startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [SlidableAction(
          spacing: 0.03,
          onPressed:(context){
            Navigator.pushNamed(context, editTaskSheet.routeName,
                arguments: widget.TaskModel);
          },
          backgroundColor: Colors.blue,
          icon: Icons.edit,
          label: 'Edit',
          borderRadius: BorderRadius.circular(15),
        ),]
    ),
    endActionPane: ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          spacing: 0.03,
          onPressed:(context){
            deleteTasks(widget.TaskModel);
          },
          backgroundColor: Colors.red,
          icon: Icons.delete,
          label: 'Delete',
          borderRadius: BorderRadius.circular(15),
        ),

      ],

    ),
    child: Container(

      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
      ),
      child: Row(
        children: [
          widget.TaskModel.isDone==false? Container(
            width: 4,
            height: 50,
            color: lightPrimaryColor ,
          ): Container(
            width: 4,
            height: 50,
            color: doneTaskColor ,
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.TaskModel.isDone==false? Text(widget.TaskModel.title, style: Theme.of(context)
                    .textTheme.headline4?.copyWith
                  (color: lightPrimaryColor , fontWeight:FontWeight.bold),):Text(widget.TaskModel.title, style: Theme.of(context)
                    .textTheme.headline4?.copyWith
                  (color: doneTaskColor , fontWeight:FontWeight.bold),),
              Text(widget.TaskModel.description,style: Theme.of(context).textTheme.headline4),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              print(widget.TaskModel.date);
              print(DateTime.fromMillisecondsSinceEpoch(widget.TaskModel.date));
              print(DateTime.now());
              if(DateUtils.dateOnly(DateTime.fromMillisecondsSinceEpoch(widget.TaskModel.date))
                  .compareTo(DateUtils.dateOnly(DateTime.now()))>=0){
                widget.TaskModel.isDone =true;
                setState(() {

                });
                updateTaskToFirebase(widget.TaskModel);
              }


            },
            child:widget.TaskModel.isDone==false ? Container(
              decoration: BoxDecoration(
                color: lightPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 60,
              height: 50,
              child:  Icon(Icons.done , color: Colors.white, size: 40,),
            ) : Text("done",style: Theme.of(context)
                .textTheme.headline4?.copyWith
              (color: doneTaskColor , fontWeight:FontWeight.bold) ,),
              )
        ],
      ),
    ),

  );

}
}


void editTask(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (context){
    return Padding(
      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: editTaskSheet(),
    );
  });
}

