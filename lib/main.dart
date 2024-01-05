import 'package:flutter/material.dart';
import "package:hive_flutter/adapters.dart";
import "package:todo_app/pages/HomePage.dart";

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("ToDo_TASK_DATABASE");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To Do App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
