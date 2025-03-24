import 'package:equatable/equatable.dart';
import 'package:student_details/data/models/student_model.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class InitializeHomeEvent extends HomeEvent {}

class GetStudentListEvent extends HomeEvent {}

class EditStudentEvent extends HomeEvent {
  const EditStudentEvent();
}

class OnSelectedAgeEvent extends HomeEvent {
  final int selectedAge;
  const OnSelectedAgeEvent({required this.selectedAge});
}

class OnSelectedClassEvent extends HomeEvent {
  final String selectedClass;

  const OnSelectedClassEvent({required this.selectedClass});
}

class AddNewStudentEvent extends HomeEvent {}

class IsEditEvent extends HomeEvent {
  final Student? selectedStudent;
  final bool isEdit;

  const IsEditEvent({this.selectedStudent, required this.isEdit});
}

class ClearDataEvent extends HomeEvent {}
