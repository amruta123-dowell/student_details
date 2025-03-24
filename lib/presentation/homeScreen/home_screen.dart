import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_details/presentation/homeScreen/bloc/home_state.dart';

import '../../data/models/student_model.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(create: (context) => HomeBloc(), child: HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (state.studentData == null ||
                    state.studentData?.isNotEmpty == true)
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "No Student Data is found.Please add the student details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                else if (state.studentData?.isNotEmpty == true) ...[
                  ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: state.studentData?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: StudentDetailsCard(
                              studentData: state.studentData?[index]),
                        );
                      })
                ]
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 197, 127, 210),
              child: const Icon(Icons.add),
              onPressed: () {}),
        );
      },
    );
  }
}

class StudentDetailsCard extends StatelessWidget {
  final Student? studentData;

  const StudentDetailsCard({
    super.key,
    this.studentData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
