import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HomeLogic {
  List<dynamic> getTaskList() {
    final taskBox = Hive.box('taskBox');
    List<dynamic> taskBoxList = taskBox.values.toList();

    taskBoxList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    taskBoxList.where((element) => element.isDone == false);

    return taskBoxList;
  }

  bool deleteTask(String id) {
    try {
      final taskBox = Hive.box('taskBox');
      taskBox.delete(id);

      debugPrint('deleted');

      return true;
    } catch (e) {
      inspect(e);
      return false;
    }
  }
}
