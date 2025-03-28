import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_details/presentation/splashScreen/bloc/splash_bloc.dart';
import 'package:student_details/presentation/splashScreen/bloc/splash_event.dart';
import 'package:student_details/presentation/splashScreen/bloc/splash_state.dart';
import 'package:student_details/utils/image_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => SplashBloc()..add(SplashInitialEvent()),
      child: const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          ImageConstant.studentImg,
          fit: BoxFit.fitWidth,
        ),
      );
    });
  }
}
