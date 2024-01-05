import 'package:hive/hive.dart';

class Database {
  var mybox = Hive.box('TODO_TASK_DATABASE');
  late List<List<dynamic>> allToDolist;

  Database() {
    if (mybox.get('Tasks') == null) {
      initialData();
    } else {
      loadExistingData();
    }
  }

  void initialData() {
    allToDolist = [
      ['HomeWork', false],
      ['Git push', false],
      ['Exam practice', false],
    ];
    updateDatabase();
  }

  void loadExistingData() {
    allToDolist = List<List<dynamic>>.from(mybox.get('Tasks'));
  }

  void updateDatabase() {
    mybox.put('Tasks', allToDolist);
  }
}
