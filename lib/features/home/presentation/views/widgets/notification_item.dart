// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/list_item.dart';
import 'package:provider/provider.dart';
import 'package:pfe_projet/core/model/message_model.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/notification_content.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return CustomListItem(
      child: NotificationContent(
          themeChange: themeChange,
          message: message,
        ),
    );
  }
}