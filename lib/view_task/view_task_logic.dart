import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class ViewTaskLogic {
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
