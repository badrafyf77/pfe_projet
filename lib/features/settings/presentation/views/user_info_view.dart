// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/core/utils/customs/icon_button.dart';
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
    return SizedBox(
      width: MediaQuery.of(context).size.width * .75,
      child: const Column(
        children: [
          SizedBox(
            height: 22,
          ),
          UserInfoItem(
            title: "Nom et prénom :",
            value: "Badreddine Afyf",
          ),
          SizedBox(
            height: 15,
          ),
          UserInfoItemVerified(
            title: "Email :",
            value: "badr123afyf@gmail.com",
          ),
          SizedBox(
            height: 15,
          ),
          UserInfoItemVerified(
            title: "Numéro du téléphone :",
            value: "0612345678",
          ),
          SizedBox(
            height: 15,
          ),
          UserInfoItemVerified(
            title: "CIN :",
            value: "WA310324",
          ),
          SizedBox(
            height: 15,
          ),
          UserInfoItem(
            title: "Date de naissance :",
            value: "18 - 05 - 2003",
          ),
        ],
      ),
    );
  }
}

class UserInfoItem extends StatelessWidget {
  const UserInfoItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: Styles.normal16.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * .75,
          decoration: BoxDecoration(
            color: AppColors.kThirdColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              value,
              style: Styles.normal18.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserInfoItemVerified extends StatelessWidget {
  const UserInfoItemVerified({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: Styles.normal16.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * .75,
              decoration: BoxDecoration(
                color: AppColors.kThirdColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    value,
                    style: Styles.normal18.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MyIconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
