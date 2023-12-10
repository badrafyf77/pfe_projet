import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfe_projet/core/configures/app_routers.dart';
import 'package:pfe_projet/core/configures/themes.dart';
import 'package:pfe_projet/core/utils/helpers.dart';
import 'package:pfe_projet/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: const SplashView(),
      getPages: AppRouters.router,
    );
  }
}
