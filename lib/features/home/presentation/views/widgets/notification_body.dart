import 'package:flutter/material.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/notification_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .8,
        child: ListView.builder(
            itemCount: 11,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  if (index == 0)
                    const SizedBox(
                      height: 20,
                    ),
                  const NotificationItem(),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              );
            }),
      ),
    );
  }
}