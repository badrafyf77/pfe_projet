import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/notification_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Messagerie",
      ),
      body: NotificationBody(),
    );
  }
}