import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:student_details/data/models/student_model.dart';

class AddStudentState extends Equatable {
  final bool? isEdit;
  final Student? selectedStudent;
  final TextEditingController? nameController;
  final String? selectedClass;
  final int? age;
  final List<int> ageList = List.generate(18, (index) => (index + 1));
  AddStudentState(
      {this.isEdit,
      this.selectedStudent,
      this.nameController,
      this.selectedClass,
      this.age});

  @override
  List<Object?> get props =>
      [isEdit, age, selectedClass, selectedStudent, nameController];

  AddStudentState copyWith(
      {bool? isEdit,
      Student? selectedStudent,
      TextEditingController? nameController,
      String? selectedClass,
      int? age}) {
    return AddStudentState(
        isEdit: isEdit ?? this.isEdit,
        selectedClass: selectedClass ?? this.selectedClass,
        nameController: nameController ?? this.nameController,
        selectedStudent: selectedStudent ?? this.selectedStudent,
        age: age ?? this.age);
  }
}
