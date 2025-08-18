import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:todo_app_1/pages/home_page.dart";

void main() async{
  
  // Initialize the hive
  await Hive.initFlutter();

  // Open the box
  await Hive.openBox("todos");
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    ); 
  }
} 