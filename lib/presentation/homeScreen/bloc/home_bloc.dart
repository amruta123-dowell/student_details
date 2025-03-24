import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_details/data/models/student_model.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<InitializeHomeEvent>(_initialize);
    on<GetStudentListEvent>(_getStudentList);
  }

  late Isar isar;
  FutureOr<void> _getStudentList(
      GetStudentListEvent event, Emitter<HomeState> emit) async {
    final studentData = await isar.students.where().findAll();
    emit(state.copyWith(studentData: studentData));
  }

  FutureOr<void> _initialize(
      InitializeHomeEvent event, Emitter<HomeState> emit) async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([StudentSchema], directory: dir.path);
    add(GetStudentListEvent());
  }
}
