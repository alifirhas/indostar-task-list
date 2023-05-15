import 'package:hive/hive.dart';

part 'task_list_model.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String judul;

  @HiveField(2)
  String detail;

  @HiveField(3)
  DateTime deadline;

  @HiveField(4)
  bool isDone;

  @HiveField(5)
  double lat;

  @HiveField(6)
  double long;

  @HiveField(7)
  DateTime createdAt;

  @HiveField(8)
  DateTime updatedAt;

  @HiveField(9)
  DateTime deletedAt;

  Task({
    required this.id,
    required this.judul,
    required this.detail,
    required this.deadline,
    this.isDone = false,
    required this.lat,
    required this.long,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });
}
