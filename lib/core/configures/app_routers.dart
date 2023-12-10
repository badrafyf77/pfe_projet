import 'package:get/get.dart';
import 'package:pfe_projet/features/auth/presentation/views/forgot_pass_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_in_view.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_up_view.dart';
import 'package:pfe_projet/features/otp/presentation/views/otp_email_view.dart';
import 'package:pfe_projet/features/home/presentation/views/home_view.dart';
import 'package:pfe_projet/features/splash/presentation/views/splash_view.dart';

class AppRouters {
  static const homeView = '/homeView';
  static const signInView = '/signInView';
  static const signUpView = '/signUpView';
  static const forgotPassView = '/forgotPassView';
  static const otpEmailView = '/otpEmailView';

  static final router = [
    GetPage(name: '/', page: () => const SplashView(),),
    GetPage(name: homeView, page: () => const HomeView(),),
    GetPage(name: signInView, page: () => const SignInView(),),
    GetPage(name: signUpView, page: () => const SignUpView(),),
    GetPage(name: otpEmailView, page: () => const OTPEmailView(),),
    GetPage(name: forgotPassView, page: () => const ForgotPassView()),
  ];
}
