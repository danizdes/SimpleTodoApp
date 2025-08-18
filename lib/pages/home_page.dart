import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:todo_app_1/data/database.dart";
import "package:todo_app_1/util/dialoge_box.dart";
import "package:todo_app_1/util/todo_tile.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Rerference the box
  final _todos = Hive.box("todos");
  TodoDatabase db = TodoDatabase();

  // Text controller
  final _controller = TextEditingController();

  // When the app runs
  @override
  void initState() {
    
    // If this is the first time ever opening the app, then create default data
    if (_todos.get("TODOLIST") == null) {
      db.createInitData();
    }else {
      // Not the first time the data exists

      db.loadData();
    }
    super.initState();
  }


  // Function that saved new task
  void saveNewTask() {
    setState(() {
      db.todos.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // Function changing the checkbox
  void changeCheckBox(bool? value, int index) { 
    setState(() {
    db.todos[index][1] = !db.todos[index][1];
    });
    db.updateData();
  }

  // Function that creates a new task
  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogeBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSaved: saveNewTask,
          ); 
      },
      );
  }

  // Function that deletes a task
  void deleteTask(int index) {
    setState(() {
      db.todos.removeAt(index);
    });
    db.updateData(); 
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
         backgroundColor: Colors.blueGrey[800],
         title: Text( 
          "TODO",
          style: TextStyle(color: Colors.white)
         ), 
         elevation: 0,
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed:  createNewTask,
        backgroundColor: Colors.blueGrey[300], 
        child: Icon(Icons. add,  color: Colors.black,)),
      body: ListView.builder(
        itemCount: db.todos.length,
        itemBuilder:(context, index) {
          return ToDoTile(
            taskName: db.todos[index][0], 
            checked: db.todos[index][1], 
            onChanged: (value) => changeCheckBox(value, index),
            deleteFunction: (context) => deleteTask(index),
            );
        },
      )
    ); 
  }
} 