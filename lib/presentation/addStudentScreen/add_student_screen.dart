import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_details/presentation/addStudentScreen/bloc/add_student_bloc.dart';
import 'package:student_details/presentation/addStudentScreen/bloc/add_student_event.dart';

import '../../data/models/student_model.dart';

class AddStudentScreen extends StatelessWidget {
  const AddStudentScreen({super.key});

  static Widget builder(BuildContext context) {
    Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return BlocProvider<AddStudentBloc>(
      create: (context) => AddStudentBloc()
        ..add(InitializeEvent(
            isEdit: args?["isEdit"] ?? false,
            selectedStudent: args?["student"])),
      child: const AddStudentScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Column(
          // mainAxisAlignment: Main,
          ),
    );
  }
}
