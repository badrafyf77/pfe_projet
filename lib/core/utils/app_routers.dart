import 'package:go_router/go_router.dart';
import 'package:pfe_projet/features/home/presentation/views/home_view.dart';
import 'package:pfe_projet/features/splash/presentation/views/splash_view.dart';

class AppRouters {
  static const homePage = '/homeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homePage,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
