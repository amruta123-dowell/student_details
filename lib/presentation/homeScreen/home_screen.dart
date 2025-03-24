import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:student_details/presentation/homeScreen/bloc/home_event.dart';
import 'package:student_details/presentation/homeScreen/bloc/home_state.dart';
import 'package:student_details/utils/image_constant.dart';

import 'package:student_details/widgets/custom_ap_bar.dart';
import 'package:student_details/widgets/custom_text_field.dart';
import 'package:student_details/widgets/dropdown_widget.dart';
import 'package:student_details/widgets/student_details_card.dart';
import 'package:student_details/widgets/title_widget.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeBloc()..add(InitializeHomeEvent()),
        child: HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const StudentDetailsAppBar(
            title: "Student Portal",
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 16,
                ),
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.elasticOut,
                  tween: Tween(begin: 0.5, end: 1),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Opacity(
                        opacity: value.clamp(0.0, 1.0),
                        child: const Text(
                          "Welcome to the Student Portal",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                            letterSpacing: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                if (state.studentData == null ||
                    state.studentData?.isEmpty == true) ...[
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      height: MediaQuery.sizeOf(context).height * 0.6,
                      ImageConstant.noDataFound,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "No Student Data is found. \n Please add the student details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ] else if (state.studentData?.isNotEmpty == true) ...[
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: state.studentData?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: StudentDetailsCard(
                              studentData: state.studentData?[index]),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                    ),
                  )
                ]
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 197, 127, 210),
              child: const Icon(Icons.add),
              onPressed: () {
                context.read<HomeBloc>().add(ClearDataEvent());
                addEditStudentDetailsSheet(
                    context: context, homeBloc: context.read<HomeBloc>());
                // NavigatorService.pushNamed(AppRoutes.addStudentScreen);
              }),
        );
      },
    );
  }
}

void addEditStudentDetailsSheet({
  required BuildContext context,
  required HomeBloc homeBloc,
}) {
  showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      )),
      enableDrag: true,
      builder: (innerContext) {
        final double maxHeight = MediaQuery.of(context).size.height * 0.65;

        return ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: maxHeight,
                minHeight: MediaQuery.of(context).size.height * .3),
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade100, // Soft Lavender
                    Colors.blue.shade100, // Light Sky Blue
                    Colors.pink.shade100, // Soft Rose Pink
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.1), // Soft shadow
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: BlocBuilder<HomeBloc, HomeState>(
                bloc: homeBloc,
                builder: (context1, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Align(
                          child: Text(
                            state.isEdit == true
                                ? "Edit Student Details"
                                : "Add Student Details",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const TitleWidget(
                          title: "Name",
                          isRequired: true,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFieldWidget(
                            textController: state.nameController,
                            onChanged: (val) {}),
                        if (state.errorName != null &&
                            state.errorName?.isNotEmpty == true) ...[
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            state.errorName ?? '',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12),
                          )
                        ],
                        const SizedBox(
                          height: 16,
                        ),
                        const TitleWidget(
                          title: "Age (Years)",
                          isRequired: true,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DropDownWidget(
                          itemList: state.ageList,
                          selectedItem: state.age,
                          onChanged: (val) {
                            context
                                .read<HomeBloc>()
                                .add(OnSelectedAgeEvent(selectedAge: val));
                          },
                        ),
                        if (state.errorAge != null &&
                            state.errorAge?.isNotEmpty == true) ...[
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            state.errorAge ?? '',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12),
                          )
                        ],
                        const SizedBox(
                          height: 16,
                        ),
                        const TitleWidget(
                          title: "Class (Std)",
                          isRequired: true,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DropDownWidget(
                          itemList: state.classList,
                          selectedItem: state.selectedClass,
                          onChanged: (val) {
                            context
                                .read<HomeBloc>()
                                .add(OnSelectedClassEvent(selectedClass: val));
                          },
                        ),
                        if (state.errorStd != null &&
                            state.errorStd?.isNotEmpty == true) ...[
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            state.errorStd ?? '',
                            style: const TextStyle(
                                color: Colors.red, fontSize: 12),
                          )
                        ],
                        const SizedBox(
                          height: 30,
                        ),
                        TweenAnimationBuilder<double>(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.elasticOut,
                          tween: Tween(
                              begin: 0.8,
                              end: 1), // Starts smaller, then bounces to normal
                          builder: (context, scale, child) {
                            return Transform.scale(
                              scale: scale,
                              child: child,
                            );
                          },
                          child: GestureDetector(
                            onTap: () {
                              state.isEdit == true
                                  ? context
                                      .read<HomeBloc>()
                                      .add(const EditStudentEvent())
                                  : context
                                      .read<HomeBloc>()
                                      .add(AddNewStudentEvent());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 50),
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(
                                    255, 186, 101, 162), // Matched color
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        const Color.fromARGB(255, 111, 185, 195)
                                            .withOpacity(0.6),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 12, 22,
                                      61), // Dark text color for contrast
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ));
      });
}
