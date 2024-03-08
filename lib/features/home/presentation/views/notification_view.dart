import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        withHeaderAndBackBar: true,
        title: "Messagerie",
      ),
      body: Material(
        color: Colors.red,
        child: InkWell(
          child: const SizedBox(width: 100, height: 100),
          onTap: () {
            print("Wow! Ripple");
          },
        ),
      ),
    );
  }
}
