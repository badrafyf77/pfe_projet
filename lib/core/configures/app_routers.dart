import 'package:get/get.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_in.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_up.dart';
import 'package:pfe_projet/features/home/presentation/views/home_view.dart';
import 'package:pfe_projet/features/splash/presentation/views/splash_view.dart';

class AppRouters {
  static const homeView = '/homeView';
  static const signInView = '/signInView';
  static const signUpView = '/signUpView';

  static final router = [
    GetPage(name: '/', page: () => const SplashView()),
    GetPage(name: homeView, page: () => const HomeView()),
    GetPage(name: signInView, page: () => const SignInView()),
    GetPage(name: signUpView, page: () => const SignUpView()),
  ];
}
