import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        toolbarHeight: 150,
        title: const Column(
          children: [
            SizedBox(
              height: 40,
            ),
            LogoAndText(
              alignment: MainAxisAlignment.center,
              scale: 1.8,
            ),
          ],
        ),
        
      ),
      body: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}
