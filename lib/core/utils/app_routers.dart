import 'package:go_router/go_router.dart';
import 'package:pfe_projet/features/auth/presentation/views/sign_in.dart';
import 'package:pfe_projet/features/home/presentation/views/home_view.dart';

class AppRouters {
  static const homeView = '/homeView';
  static const signInView = '/signInView';

  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const SplashView(),
      // ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const SignInView(),
      ),
    ],
  );
}
