import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/taskDM.dart';

CollectionReference <task> taskCollection ()
{
 return FirebaseFirestore.instance.collection("Task").withConverter <task>(
     fromFirestore: (snapshot,options) => task.fromJson(snapshot.data()!)
 , toFirestore : (task, options) => task.toJson(),);
}


void addTask(task Task1){
 var collection =taskCollection();
 var document =taskCollection().doc();
 Task1.id = document.id;
 document.set(Task1);
}

Stream<QuerySnapshot<task>> getTasks (DateTime datetime){
 return taskCollection().where
  ("date", isEqualTo: DateUtils.dateOnly(datetime).millisecondsSinceEpoch).snapshots();
}

Future<void> deleteTasks(task Tasks){
 return taskCollection().doc(Tasks.id).delete();
}

Future<void> updateTaskToFirebase(task taskData) {
 return taskCollection().doc(taskData.id).update(taskData.toJson());
}