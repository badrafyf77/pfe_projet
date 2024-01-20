import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:go_router/go_router.dart';
import 'package:pfe_projet/core/utils/service_locator.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo_implement.dart';
import 'package:pfe_projet/features/auth/presentation/views/auth_gate.dart';
import 'package:pfe_projet/features/auth/presentation/views/check_email_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/forgot_pass_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/manager/check%20email%20cubit/check_email_cubit.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_in_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_up_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/otp_num_view.dart';
import 'package:pfe_projet/features/google_maps/presentation/views/google_maps_view.dart';
import 'package:pfe_projet/features/home/presentation/views/home_view.dart';
import 'package:pfe_projet/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const splashView = '/splashView';
  static const homeView = '/homeView';
  static const signInView = '/signInView';
  static const signUpView = '/signUpView';
  static const otpNumView = '/otpNumView';
  static const forgotPassView = '/forgotPassView';
  static const checkEmailView = '/checkEmailView';
  static const googleMapsView = '/googleMapsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AuthGate(),
      ),
      GoRoute(
        path: splashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: signInView,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: signUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: forgotPassView,
        builder: (context, state) => const ForgotPassView(),
      ),
      GoRoute(
        path: otpNumView,
        builder: (context, state) => const OTPNumView(),
      ),
      GoRoute(
        path: checkEmailView,
        builder: (context, state) => bloc.BlocProvider(
          create: (context) => CheckEmailCubit(getIt.get<AuthRepoImplement>())
            ..checkEmailCubit(),
          child: const CheckEmailView(),
        ),
      ),
      GoRoute(
        path: googleMapsView,
        builder: (context, state) => const GoogleMapsView(),
      ),
    ],
  );

  static void navigateTo(BuildContext context, String path) {
    context.push(path);
  }

  static void navigateOff(BuildContext context, String path) {
    context.pushReplacement(path);
  }

  static void pop(BuildContext context) {
    context.pop();
  }
}
