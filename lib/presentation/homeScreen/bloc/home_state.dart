import 'package:equatable/equatable.dart';

import '../../../data/models/student_model.dart';

class HomeState extends Equatable {
  final List<Student>? studentData;
  const HomeState({this.studentData});

  HomeState copyWith({List<Student>? studentData}) {
    return HomeState(studentData: studentData ?? this.studentData);
  }

  @override
  List<Object?> get props => [studentData];
}
