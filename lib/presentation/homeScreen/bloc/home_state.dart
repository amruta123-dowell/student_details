import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/models/student_model.dart';

class HomeState extends Equatable {
  final List<Student>? studentData;
  final bool? isEdit;
  final Student? selectedStudent;
  final TextEditingController? nameController;
  final String? selectedClass;
  final int? age;
  final List<int> ageList = List.generate(13, (index) => (index + 6));
  final List<String> classList =
      List.generate(12, (index) => (index + 1).toString());
  final String? errorName;
  final String? errorStd;
  final String? errorAge;
  HomeState(
      {this.studentData,
      this.isEdit,
      this.selectedStudent,
      this.nameController,
      this.selectedClass,
      this.age,
      this.errorAge,
      this.errorName,
      this.errorStd});

  HomeState copyWith(
      {List<Student>? studentData,
      bool? isEdit,
      Student? selectedStudent,
      int? age,
      TextEditingController? nameController,
      String? selectedClass,
      bool? makeValueNull,
      String? errorName,
      String? errorAge,
      String? errorClass}) {
    return HomeState(
        studentData: studentData ?? this.studentData,
        age: makeValueNull == true ? null : age ?? this.age,
        selectedClass:
            makeValueNull == true ? null : selectedClass ?? this.selectedClass,
        nameController: nameController ?? this.nameController,
        isEdit: isEdit ?? this.isEdit,
        selectedStudent: selectedStudent ?? this.selectedStudent,
        errorAge: errorAge ?? this.errorAge,
        errorName: errorName ?? this.errorName,
        errorStd: errorClass ?? this.errorStd);
  }

  @override
  List<Object?> get props => [
        studentData,
        isEdit,
        age,
        selectedClass,
        selectedStudent,
        nameController,
        ageList,
        classList,
        errorAge,
        errorName,
        errorStd
      ];
}
