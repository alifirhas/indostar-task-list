import 'package:hive_flutter/hive_flutter.dart';
import 'package:startertemplate/models/task_list_model.dart';

class AddTaskLogic {
  bool tambahTask(Task task) {
    try {
      Hive.box('taskBox').put(task.id, task);
      return true;
    } catch (e) {
      return false;
    }
  }
}
