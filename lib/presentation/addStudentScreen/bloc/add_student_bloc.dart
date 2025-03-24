import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:student_details/presentation/addStudentScreen/bloc/add_student_event.dart';
import 'package:student_details/presentation/addStudentScreen/bloc/add_student_state.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  AddStudentBloc() : super(AddStudentState()) {
    on<AddStudentEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<InitializeEvent>(_initialize);
    on<AddNewStudentEvent>(_addNewStudent);
    on<EditStudentEvent>(_editStudentDetails);
  }

  FutureOr<void> _initialize(
      InitializeEvent event, Emitter<AddStudentState> emit) async {}

  FutureOr<void> _addNewStudent(
      AddNewStudentEvent event, Emitter<AddStudentState> emit) async {}

  FutureOr<void> _editStudentDetails(
      EditStudentEvent event, Emitter<AddStudentState> emit) {}
}
