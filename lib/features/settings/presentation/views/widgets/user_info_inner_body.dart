import 'package:flutter/material.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/user_info_item.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/user_info_item_verified.dart';

class UserInfoInnerBody extends StatelessWidget {
  const UserInfoInnerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
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
      ),
    );
  }
}
