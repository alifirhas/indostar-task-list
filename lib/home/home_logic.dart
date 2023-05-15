import 'package:hive_flutter/adapters.dart';

class HomeLogic {
  List<dynamic> getTaskList() {
    final taskBox = Hive.box('taskBox');
    List<dynamic> taskBoxList = taskBox.values.toList();

    taskBoxList.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return taskBoxList;
  }
}
