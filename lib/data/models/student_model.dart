import 'package:isar/isar.dart';

part 'student_model.g.dart';

@Collection()
class Student {
  Id id = Isar.autoIncrement; // Auto-incrementing ID

  late String name;
  late int age;
  late String course;
}