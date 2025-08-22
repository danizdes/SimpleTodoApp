import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {

  List todos = [];

  // Reference the box
  final _todos = Hive.box("todos");

  // Run this method if first time opening this app
  void createInitData() {
    todos = [
      ["Read 10 pages", "From the book 48 Laws of power", false],
      ["Go out for a walk", "Only go for 10 minutes!", false],
    ];
  }

  // Load data from db

  void loadData() {
    todos = _todos.get("TODOLIST");
  } 

  // Update Data from db
  void updateData() {
    _todos.put("TODOLIST", todos);
  } 
}