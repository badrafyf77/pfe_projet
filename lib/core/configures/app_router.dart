import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:go_router/go_router.dart';
import 'package:pfe_projet/core/utils/service_locator.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo_implement.dart';
import 'package:pfe_projet/features/auth/presentation/views/auth_gate.dart';
import 'package:pfe_projet/features/auth/presentation/views/check_email_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/forgot_pass_view.dart';
import 'package:pfe_projet/features/auth/presentation/manager/check%20email%20cubit/check_email_cubit.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_in_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_up_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/otp_num_view.dart';
import 'package:pfe_projet/features/google_maps/presentation/views/google_maps_view.dart';
import 'package:pfe_projet/features/home/presentation/views/home_view.dart';
import 'package:pfe_projet/features/home/presentation/views/notification_view.dart';
import 'package:pfe_projet/features/insurances/presentation/views/insurance_info_view.dart';
import 'package:pfe_projet/features/insurances/presentation/views/our_insurances_view.dart';
import 'package:pfe_projet/features/settings/data/repo/user_info_repo_implement.dart';
import 'package:pfe_projet/features/settings/presentation/manager/get%20user%20cubit/get_user_cubit.dart';
import 'package:pfe_projet/features/settings/presentation/views/change_email_view.dart';
import 'package:pfe_projet/features/settings/presentation/views/change_password_view.dart';
import 'package:pfe_projet/features/settings/presentation/views/security_view.dart';
import 'package:pfe_projet/features/settings/presentation/views/settings_view.dart';
import 'package:pfe_projet/features/settings/presentation/views/user_info_view.dart';
import 'package:pfe_projet/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const splashView = '/splashView';
  static const googleMapsView = '/googleMapsView';

  static var authFeature = (
    signInView: '/signInView',
    signUpView: '/signUpView',
    otpNumView: '/otpNumView',
    forgotPassView: '/forgotPassView',
    checkEmailView: '/checkEmailView',
  );
  static var homeFeature = (
    homeView: '/homeView',
    notificationView: '/notificationView',
  );
  static var settingsFeature = (
    settingsView: '/settingsView',
    userInfoView: '/userInfoView',
    securityView: '/securityView',
    changeEmailView: '/changeEmailView',
    changePasswordView: '/changePasswordView',
  );
  static var insurancesFeature = (
    ourInsurancesView: '/ourInsurancesView',
    insurancesInfoView: '/insurancesInfoView',
  );

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
        path: homeFeature.homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: authFeature.signInView,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: authFeature.signUpView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: authFeature.forgotPassView,
        builder: (context, state) => const ForgotPassView(),
      ),
      GoRoute(
        path: authFeature.otpNumView,
        builder: (context, state) => const OTPNumView(),
      ),
      GoRoute(
        path: authFeature.checkEmailView,
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
      GoRoute(
        path: homeFeature.notificationView,
        builder: (context, state) => const NotificationView(),
      ),
      GoRoute(
        path: settingsFeature.settingsView,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: settingsFeature.userInfoView,
        builder: (context, state) =>bloc.BlocProvider(
          create: (context) => GetUserCubit(getIt.get<UserInfoRepoImplement>(),FirebaseAuth.instance.currentUser!.email!)
            ..getUserCubit(),
          child: const UserInfoView(),
        ),
      ),
      GoRoute(
        path: settingsFeature.securityView,
        builder: (context, state) => const SecurityView(),
      ),
      GoRoute(
        path: settingsFeature.changeEmailView,
        builder: (context, state) => const ChangeEmailView(),
      ),
      GoRoute(
        path: settingsFeature.changePasswordView,
        builder: (context, state) => const ChangePasswordView(),
      ),
      GoRoute(
        path: insurancesFeature.ourInsurancesView,
        builder: (context, state) => const OurInsurancesView(),
      ),
      GoRoute(
          path: insurancesFeature.insurancesInfoView,
          builder: (context, state) {
            String insuranceType = state.extra as String;
            return InsurancesInfoView(
              insuranceType: insuranceType,
            );
          }),
    ],
  );

  static void navigateTo(BuildContext context, String path, [Object obj = ""]) {
    String str = obj as String;
    if (str == "") {
      context.push(
        path,
      );
    } else {
      context.push(
        path,
        extra: obj,
      );
    }
  }

  static void navigateOff(BuildContext context, String path) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    context.pushReplacement(path);
  }

  static void pop(BuildContext context) {
    context.pop();
  }
}
