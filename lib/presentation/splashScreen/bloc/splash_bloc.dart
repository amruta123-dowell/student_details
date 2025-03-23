import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:student_details/presentation/splashScreen/bloc/splash_event.dart';
import 'package:student_details/routes/app_routes.dart';
import 'package:student_details/utils/navigator_service.dart';

import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<SplashEvent>((event, emit) {});
    on<SplashInitialEvent>(_navigateToHome);
  }

  FutureOr<void> _navigateToHome(
      SplashInitialEvent event, Emitter<SplashState> emit) {
    Future.delayed(const Duration(milliseconds: 700), () {

      NavigatorService.pushNamed(AppRoutes.homeScreen);
    });
  }
}
