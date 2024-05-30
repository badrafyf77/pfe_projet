// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/model/message_model.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({
    Key? key,
    required this.themeChange,
    required this.message,
  }) : super(key: key);

  final DarkThemeProvider themeChange;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notification',
                style: Styles.normal12.copyWith(
                  color: themeChange.darkTheme
                      ? AppColors.kThirdColor
                      : Colors.black,
                ),
              ),
              Text(
                DateTimeFormat.format(message.createdAt.toDate(),
                    format: DateTimeFormats.european),
                style: Styles.normal12.copyWith(
                  color: themeChange.darkTheme
                      ? AppColors.kThirdColor
                      : Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                message.message,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                textAlign: TextAlign.justify,
                style: Styles.normal14.copyWith(
                  color: themeChange.darkTheme
                      ? AppColors.kThirdColor
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
