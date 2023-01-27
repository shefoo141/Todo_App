import 'package:flutter/material.dart';
import 'package:todo_app/appStyle/colors.dart';
import 'package:todo_app/appStyle/themes.dart';
import 'package:todo_app/dataBase/dataBase_config.dart';
import 'package:todo_app/models/taskDM.dart';

class addTaskSheet extends StatefulWidget {

  @override
  State<addTaskSheet> createState() => _addTaskSheetState();
}

class _addTaskSheetState extends State<addTaskSheet> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  GlobalKey <FormState> formKey = GlobalKey<FormState>();
  GlobalKey <FormState> formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add New Task',textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5),
            SizedBox(height: 10,),
            Form(
                key : formKey,
                child: TextFormField(
                    controller: titleController,
               validator: (string){
                if(string?.trim()=="" || string== null)
                  return "Please Enter Task Title";
                else{
                  return null;
                }
              },
              decoration: InputDecoration(
                label: Text('Enter Task Title',
                  style: Theme.of(context).textTheme.bodyText1),
              ),
            )),
            SizedBox(height: 10,),
            Form(
                key : formKey2,
                child: TextFormField(
                    controller: descController,
                validator: (string2){
                  if(string2?.trim()=="" || string2== null)
                    return "Please Enter Task Description";
                  else{
                    return null;
                  }
                },
              maxLines: 3,
              decoration: InputDecoration(
                label: Text('Enter Task Description'
              ,style: Theme.of(context).textTheme.bodyText1,
              ),
            ))),
            SizedBox(height: 30,),
            Text('Select Time' , style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                showDate();
              },
              child: Text('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}' ,textAlign: TextAlign.center
                  , style: Theme.of(context).textTheme.headline1),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              if(formKey.currentState!.validate() || formKey2.currentState!.validate());
              task Task = task(title:titleController.text ,
                  description: descController.text,
                  date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
               addTask(Task);
               Navigator.pop(context);
            }, child: Text('add task'))
          ],
        ),
      ),
    );
  }

  void showDate()async {
   DateTime ? Date= await showDatePicker(
        context: context,
        initialDate:selectedDate,
        firstDate: DateTime.now().subtract(Duration(days: 365)),
        lastDate: DateTime.now().add(Duration(days: 365)),
    );
   if(Date == null) return;
   selectedDate= Date;
   setState(() {});
  }
}
