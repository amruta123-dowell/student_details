import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_details/data/models/student_model.dart';
import 'package:student_details/utils/navigator_service.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<InitializeHomeEvent>(_initialize);
    on<GetStudentListEvent>(_getStudentList);
    on<AddNewStudentEvent>(_addNewStudent);
    on<EditStudentEvent>(_editStudentDetails);
    on<OnSelectedAgeEvent>(_selectedAge);
    on<OnSelectedClassEvent>(_selectedClass);
    on<ClearDataEvent>(_clearData);
  }

  late Isar isar;
  FutureOr<void> _getStudentList(
      GetStudentListEvent event, Emitter<HomeState> emit) async {
    try {
      final studentData = await isar.students.where().findAll();
      emit(state.copyWith(studentData: studentData));

      log(studentData.toString());
    } catch (error) {
      print(error);
    }
  }

  FutureOr<void> _initialize(
      InitializeHomeEvent event, Emitter<HomeState> emit) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open([StudentSchema], directory: dir.path);
      emit(state.copyWith(nameController: TextEditingController()));
      if (isar != null) {
        add(GetStudentListEvent());
      }
    } catch (error) {
      print(error);
    }
  }

  FutureOr<void> _addNewStudent(
      AddNewStudentEvent event, Emitter<HomeState> emit) async {
    if (!validateField(emit)) {
      return;
    }
    try {
      final newStudent = Student()
        ..id = Isar.autoIncrement
        ..age = state.age ?? 0
        ..course = state.selectedClass ?? "1"
        ..name = state.nameController?.text ?? '';
      await isar.writeTxn(() async {
        return isar.students.put(newStudent);
      });

      add(GetStudentListEvent()); //
      NavigatorService.goBack();
    } catch (error) {
      print(error);
      NavigatorService.goBack();
    }
  }

  FutureOr<void> _editStudentDetails(
      EditStudentEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> _selectedClass(
      OnSelectedClassEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedClass: event.selectedClass));
  }

  FutureOr<void> _selectedAge(
      OnSelectedAgeEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(age: event.selectedAge));
    state.age;
  }

  FutureOr<void> _clearData(ClearDataEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(isEdit: false));
    emit(state.copyWith(
        makeValueNull: true,
        isEdit: false,
        selectedClass: null,
        selectedStudent: null,
        age: null,
        nameController: TextEditingController(),
        errorAge: '',
        errorClass: '',
        errorName: ''));
  }

  bool validateField(Emitter<HomeState> emit) {
    validateAge(emit);
    validateClass(emit);
    validateName(emit);
    if (validateAge(emit) == true &&
        validateClass(emit) == true &&
        validateName(emit) == true) {
      return true;
    } else {
      return false;
    }
  }

  bool validateAge(Emitter<HomeState> emit) {
    if (state.age == null) {
      emit(state.copyWith(errorAge: "The Age is Mandatory."));
      return false;
    } else {
      return true;
    }
  }

  bool validateName(Emitter<HomeState> emit) {
    if (state.nameController?.text == null ||
        state.nameController?.text == "") {
      emit(state.copyWith(errorName: "Name is Mandatory."));
      return false;
    } else {
      return true;
    }
  }

  bool validateClass(Emitter<HomeState> emit) {
    if (state.selectedClass == null) {
      emit(state.copyWith(errorClass: "Class is Mandatory."));
      return false;
    } else {
      return true;
    }
  }
}
