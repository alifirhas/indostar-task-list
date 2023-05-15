import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class EditTaskLogic {
  bool updateTugas(
    String id,
    String judul,
    String detail,
    DateTime deadline,
  ) {
    try {
      final taskBox = Hive.box('taskBox');
      final taskObject = taskBox.get(id);

      if (taskObject != null) {
        taskObject.judul = judul;
        taskObject.deadline = deadline;
        taskObject.detail = detail;
        Hive.box('taskBox').put(id, taskObject);
      }

      debugPrint('selesai');

      return true;
    } catch (e) {
      inspect(e);
      return false;
    }
  }
}
