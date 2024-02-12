import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/app_header_title_and_back.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(),
      body: UserInfoBody(),
    );
  }
}

class UserInfoBody extends StatelessWidget {
  const UserInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppHeader(
          text: "Données personnelles",
        ),
        UserInfoInnerBody(),
      ],
    );
  }
}

class UserInfoInnerBody extends StatelessWidget {
  const UserInfoInnerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
