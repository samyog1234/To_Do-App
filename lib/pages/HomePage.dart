import 'package:flutter/material.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/widget/popUpBox.dart';
import 'package:todo_app/widget/taskItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final Database db = Database();

  @override
  void initState() {
    db.loadExistingData();
    super.initState();
  }

  void onTaskCompleted(int index) {
    setState(() {
      db.allToDolist[index][1] = !db.allToDolist[index][1];
    });
    db.updateDatabase();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return popUpBox(
          hintText: 'Add new Task',
          textController: _controller,
          onTaskSave: onTaskSave,
          buttonName1: 'Cancel',
          buttonName2: 'Save',
        );
      },
    );
  }

  void onTaskSave() {
    setState(() {
      db.allToDolist.add([_controller.text, false]);
    });
    _controller.clear();
    db.updateDatabase();
    Navigator.of(context).pop();
  }

  void onTaskDelete(int index) {
    setState(() {
      db.allToDolist.removeAt(index);
    });
    db.updateDatabase();
  }

  void onEdit(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return popUpBox(
          hintText: 'Update task',
          onTaskSave: () => onTaskUpdate(index),
          textController: _controller,
          buttonName1: 'Cancel',
          buttonName2: 'Update',
        );
      },
    );
    _controller.text = db.allToDolist[index][0];
  }

  void onTaskUpdate(int index) {
    setState(() {
      db.allToDolist[index][0] = _controller.text;
    });
    _controller.clear();
    db.updateDatabase();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.green.shade200,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: db.allToDolist.length,
          itemBuilder: (context, index) {
            return TaskItem(
              value: db.allToDolist[index][1],
              title: db.allToDolist[index][0],
              onCharged: (value) => onTaskCompleted(index),
              onDelete: (value) => onTaskDelete(index),
              onEdit: (value) => onEdit(index),
            );
          },
        ),
      ),
    );
  }
}
