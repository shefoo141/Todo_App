import 'package:flutter/material.dart';
import 'package:todo_app/appStyle/colors.dart';
import 'package:todo_app/appStyle/themes.dart';

class addTaskSheet extends StatefulWidget {

  @override
  State<addTaskSheet> createState() => _addTaskSheetState();
}

class _addTaskSheetState extends State<addTaskSheet> {
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
                validator: (string2){
                  if(string2?.trim()=="" || string2== null)
                    return "Please Enter Task Description";
                  else{
                    return null;
                  }
                },
              maxLines: 4,
              decoration: InputDecoration(
                label: Text('Enter Task Description'
              ,style: Theme.of(context).textTheme.bodyText1,
              ),
            ))),
            SizedBox(height: 30,),
            Text('Select Time' , style: Theme.of(context).textTheme.headline4),
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
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365*10000000)),
    );
   if(Date == null) return;
   selectedDate= Date;
   setState(() {});
  }
}
