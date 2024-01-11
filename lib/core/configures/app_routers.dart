import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:pfe_projet/core/utils/service_locator.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo_implement.dart';
import 'package:pfe_projet/features/auth/presentation/views/check_email_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/forgot_pass_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/manager/check%20email%20cubit/check_email_cubit.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_in_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_up_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/otp_num_view.dart';
import 'package:pfe_projet/features/google_maps/presentation/views/google_maps_view.dart';
import 'package:pfe_projet/features/home/presentation/views/home_view.dart';
import 'package:pfe_projet/features/splash/presentation/views/splash_view.dart';

class AppRouters {
  static const homeView = '/homeView';
  static const signInView = '/signInView';
  static const signUpView = '/signUpView';
  static const otpNumView = '/otpNumView';
  static const forgotPassView = '/forgotPassView';
  static const checkEmailView = '/checkEmailView';
  static const googleMapsView = '/googleMapsView';

  static final router = [
    GetPage(
      name: '/',
      page: () => const SplashView(),
    ),
    GetPage(
      name: homeView,
      page: () => const HomeView(),
    ),
    GetPage(
      name: signInView,
      page: () => const SignInView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signUpView,
      page: () => const SignUpView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: otpNumView,
      page: () => const OTPNumView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: checkEmailView,
      page: () => bloc.BlocProvider(
        create: (context) =>
            CheckEmailCubit(getIt.get<AuthRepoImplement>())..checkEmailCubit(),
        child: const CheckEmailView(),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: forgotPassView,
      page: () => const ForgotPassView(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: googleMapsView,
      page: () => const GoogleMapsView(),
      transition: Transition.fade,
    ),
  ];

  static void navigateTo(String name) {
    Get.toNamed(name);
  }

  static void navigateOff(String name) {
    Get.offNamed(name);
  }
}
