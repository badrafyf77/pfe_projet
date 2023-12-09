import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe_projet/core/utils/app_routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouters.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        textTheme: GoogleFonts.allertaTextTheme(ThemeData().textTheme),
      ),
    );
  }
}
