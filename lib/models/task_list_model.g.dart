// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      id: fields[0] as String,
      judul: fields[1] as String,
      detail: fields[2] as String,
      deadline: fields[3] as DateTime,
      isDone: fields[4] as bool,
      lat: fields[5] as double,
      long: fields[6] as double,
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime,
      deletedAt: fields[9] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.judul)
      ..writeByte(2)
      ..write(obj.detail)
      ..writeByte(3)
      ..write(obj.deadline)
      ..writeByte(4)
      ..write(obj.isDone)
      ..writeByte(5)
      ..write(obj.lat)
      ..writeByte(6)
      ..write(obj.long)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.deletedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
