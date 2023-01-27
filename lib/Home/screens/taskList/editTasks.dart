

import 'package:flutter/material.dart';
import 'package:todo_app/dataBase/dataBase_config.dart';

import '../../../models/taskDM.dart';

class editTaskSheet extends StatefulWidget {
  static String routeName = "upadteTask";

  @override
  State<editTaskSheet> createState() => _editTaskSheetState();
}

class _editTaskSheetState extends State<editTaskSheet> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  GlobalKey <FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    task myTask = ModalRoute.of(context)!.settings.arguments as task;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Edit Task',textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5),
                  SizedBox(height: 10,),
                  Form(
                    key : formKey,
                    child: Column(
                      children: [
                        TextFormField(
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
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
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
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text('Select Time' , style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      showDate2();
                    },
                    child: Text('${selectedDate.year}/${selectedDate.month}/${selectedDate.day}' ,textAlign: TextAlign.center
                        , style: Theme.of(context).textTheme.headline1),
                  ),
                  ElevatedButton(onPressed: (){
                    task TaskData = task(
                        id: myTask.id,
                        title:titleController.text ,
                        description: descController.text,
                        date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
                    updateTaskToFirebase(TaskData);
                    Navigator.pop(context);
                    if(formKey.currentState!.validate());
                  }, child: Text('Change task'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showDate2()async {
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

