import "package:flutter/material.dart";
import "package:todo_app_1/util/my_button.dart";

class DialogeBox extends StatelessWidget {
  final controller;
  final VoidCallback onSaved;
  final VoidCallback onCancel;

  DialogeBox({super.key, required this.controller, required this.onCancel, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      content: Container( 
        height: 200,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Text to tell the user what to do
            Center(
              child: Text(
                "Enter your task",
                style: TextStyle(fontSize: 25),
              ),
            ),

            // Get User Input
            TextField(
              maxLength: 18,
              controller: controller,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: "Go get groceries",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0), // Unfocused border
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0), // Focused border
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              // Save Button
              myButton(onPressed: onSaved, text: "Save"),
               const SizedBox(width: 10),
              // Cancel Button 
              myButton(onPressed: onCancel, text: "Cancel ")
            ],)
          ], 
        ),
      ), 
    );
  }
}
 
