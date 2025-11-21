import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/model/todo_model.dart';

class TodoService {
  final todoCollection = FirebaseFirestore.instance.collection('todoApp');

  //CREATE
  Future<void> addNewTask(TodoModel model) async {
    todoCollection.add(model.toMap());
  }
}
