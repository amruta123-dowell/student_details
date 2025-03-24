import 'package:equatable/equatable.dart';

import '../../../data/models/student_model.dart';

class AddStudentEvent extends Equatable {
  const AddStudentEvent();

  @override
  List<Object?> get props => [];
}

class InitializeEvent extends AddStudentEvent {
  final bool? isEdit;
  final Student? selectedStudent;

  const InitializeEvent({this.isEdit, this.selectedStudent});

  @override
  List<Object?> get props => [isEdit, selectedStudent];
}

class AddNewStudentEvent extends AddStudentEvent {
  const AddNewStudentEvent();
}

class EditStudentEvent extends AddStudentEvent {
  const EditStudentEvent();
}
