import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/model/todo_model.dart';

class TodeService {
  final todoCollection = FirebaseFirestore.instance.collection('todoApp');

  //CREATE
  void addNewTask(TodoModel model) {
    todoCollection.add(model.toMap());
  }
}
