// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool checked;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;


  ToDoTile({
    super.key,
    required this.taskName, 
    required this.checked,
    required this.onChanged,
    required this.deleteFunction
  });


  @override
  Widget build(BuildContext context,) {
    return Padding( 
      padding: const EdgeInsets.only(right: 30.0, left: 30.0, top:30.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), 
        children: [
          SlidableAction(  
            onPressed: deleteFunction,
            icon: Icons.delete, 
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(20),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey[300],
            borderRadius: BorderRadius.circular(20)
            ),
          child: Row(
            children: [
        
              // CheckBox
              Checkbox(value: checked, onChanged: onChanged, activeColor:  Colors.black,),
        
              // Name of Task
              Text(taskName , style: TextStyle(
                fontSize: 25,
                decoration: checked ? TextDecoration.lineThrough : TextDecoration.none,
              )),
            ]
          ), 
        ),
      ),
    );
  }
}