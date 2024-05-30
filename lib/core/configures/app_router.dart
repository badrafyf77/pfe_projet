import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pfe_projet/core/utils/service_locator.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo_implementation.dart';
import 'package:pfe_projet/features/auth/presentation/views/auth_gate.dart';
import 'package:pfe_projet/features/auth/presentation/views/check_email_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/forgot_pass_view.dart';
import 'package:pfe_projet/features/auth/presentation/manager/check%20email%20cubit/check_email_cubit.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_in_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_up_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/otp_num_view.dart';
import 'package:pfe_projet/features/checkdata/data/repo/checkdata_repo_implementation.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/manager/check%20cin%20bloc/check_cin_bloc.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/manager/get%20image%20bloc/get_image_bloc.dart';
import 'package:pfe_projet/features/checkdata/presentation/views/pickfile_view.dart';
import 'package:pfe_projet/features/flutter_map/presentation/views/flutter_map_view.dart';
import 'package:pfe_projet/features/home/data/home_repo_implementation.dart';
import 'package:pfe_projet/features/home/presentation/manager/get%20messages/get_messages_cubit.dart';
import 'package:pfe_projet/features/home/presentation/views/home_view.dart';
import 'package:pfe_projet/features/home/presentation/views/notification_view.dart';
import 'package:pfe_projet/features/insurances/presentation/views/devis_duration_view.dart';
import 'package:pfe_projet/features/insurances/presentation/views/devis_info_view.dart';
import 'package:pfe_projet/features/insurances/presentation/views/insurance_info_view.dart';
import 'package:pfe_projet/features/insurances/presentation/views/our_insurances_view.dart';
import 'package:pfe_projet/features/settings/data/repo/settings_repo_implementation.dart';
import 'package:pfe_projet/features/settings/presentation/manager/get%20user%20cubit/get_user_cubit.dart';
import 'package:pfe_projet/features/settings/presentation/manager/securite%20bloc/securite_bloc.dart';
import 'package:pfe_projet/features/settings/presentation/views/change_email_view.dart';
import 'package:pfe_projet/features/settings/presentation/views/change_password_view.dart';
import 'package:pfe_projet/features/settings/presentation/views/security_view.dart';
import 'package:pfe_projet/features/settings/presentation/views/settings_view.dart';
import 'package:pfe_projet/features/settings/presentation/views/user_info_view.dart';
import 'package:pfe_projet/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const splashView = '/splash';
  static const flutterMapView = '/googleMaps';
  static const pickfileView = '/pickfile';

  static var authFeature = (
    signInView: '/signIn',
    signUpView: '/signUp',
    otpNumView: '/otpNum',
    forgotPassView: '/forgotPass',
    checkEmailView: '/checkEmail',
  );
  static var homeFeature = (
    homeView: '/home',
    notificationView: '/notification',
  );
  static var settingsFeature = (
    settingsView: '/settings',
    userInfoView: '/userInfo',
    securityView: '/security',
    changeEmailView: '/changeEmail',
    changePasswordView: '/changePassword',
  );
  static var insurancesFeature = (
    ourInsurancesView: '/ourInsurances',
    insurancesInfoView: '/insurancesInfo',
    devisInfoView: '/devisInfo',
    devisDurationView: '/devisDuration',
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
        builder: (context, state) => BlocProvider(
          create: (context) => CheckEmailCubit(getIt.get<AuthRepoImplement>())
            ..checkEmailCubit(),
          child: const CheckEmailView(),
        ),
      ),
      GoRoute(
        path: flutterMapView,
        builder: (context, state) => const FlutterMapView(),
      ),
      GoRoute(
        path: homeFeature.notificationView,
        builder: (context, state) => BlocProvider(
          create: (context) => GetMessagesCubit(
            getIt.get<HomeRepoImplementation>(),
          )..getMessagesCubit(),
          child: const NotificationView(),
        ),
      ),
      GoRoute(
        path: settingsFeature.settingsView,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: settingsFeature.userInfoView,
        builder: (context, state) => BlocProvider(
          create: (context) => GetUserCubit(getIt.get<SettingsRepoImplement>(),
              FirebaseAuth.instance.currentUser!.email!)
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
        builder: (context, state) => BlocProvider(
          create: (BuildContext context) => SecuriteBloc(
            getIt.get<SettingsRepoImplement>(),
          ),
          child: const ChangeEmailView(),
        ),
      ),
      GoRoute(
        path: settingsFeature.changePasswordView,
        builder: (context, state) => BlocProvider(
          create: (BuildContext context) => SecuriteBloc(
            getIt.get<SettingsRepoImplement>(),
          ),
          child: const ChangePasswordView(),
        ),
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
        },
      ),
      GoRoute(
        path: insurancesFeature.devisInfoView,
        builder: (context, state) => const DevisInfoView(),
      ),
      GoRoute(
        path: insurancesFeature.devisDurationView,
        builder: (context, state) => const DevisDurationView(),
      ),
      GoRoute(
        path: pickfileView,
        builder: (context, state) {
          String cin = state.extra as String;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) => GetImageBloc(
                  getIt.get<CheckDataRepoImplement>(),
                ),
              ),
              BlocProvider(
                create: (BuildContext context) => CheckCinBloc(
                  getIt.get<CheckDataRepoImplement>(),
                ),
              ),
            ],
            child: PickFileView(
              cin: cin,
            ),
          );
        },
      ),
    ],
  );

  static void navigateTo(BuildContext context, String path) {
    context.push(
      path,
    );
  }

  static void navigateToWithExtra(
      BuildContext context, String path, Object obj) {
    context.push(
      path,
      extra: obj,
    );
  }

  static Future<void> navigateToAndDoSomething(
      BuildContext context, String path, Function(Object?) function) async {
    context
        .push(
          path,
        )
        .then(function);
  }

  static Future<void> navigateToAndDoSomethingWithExtra(BuildContext context,
      String path, Object obj, Function(Object?) function) async {
    context
        .push(
          path,
          extra: obj,
        )
        .then(function);
  }

  static void navigateOff(BuildContext context, String path) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    context.pushReplacement(path);
  }

  static void pop(BuildContext context) {
    context.pop();
  }
}
