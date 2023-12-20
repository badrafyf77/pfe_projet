import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pfe_projet/core/configures/app_routers.dart';
import 'package:pfe_projet/core/configures/themes.dart';
import 'package:pfe_projet/core/utils/service_locator.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo_implement.dart';
import 'package:pfe_projet/features/auth/presentation/views/manager/auth%20bloc/auth_bloc.dart';
import 'package:pfe_projet/features/auth/presentation/views/manager/check%20email%20cubit/check_email_cubit.dart';
import 'package:pfe_projet/features/splash/presentation/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  runApp(const MyApp());
  setupServiceLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthBloc(
            getIt.get<AuthRepoImplement>(),
          ),
        ),
        BlocProvider(
          create: (BuildContext context) => CheckEmailCubit(
            getIt.get<AuthRepoImplement>(),
          )..checkEmailCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        home: const SplashView(),
        getPages: AppRouters.router,
      ),
    );
  }
}
