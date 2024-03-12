import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';

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

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return MyBlurContainer(
      height: 75,
      width: MediaQuery.of(context).size.width * .79,
      opacity: 0.6,
      color: Colors.white,
      blurContainerBody: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notification',
                  style: Styles.normal12.copyWith(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Text(
                  '12/02/2024',
                  style: Styles.normal12.copyWith(
                    color: Colors.black.withOpacity(0.6),
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
                  'Veuillez vérifier votre adresse e-mailVeuillez vérifier votre adresse e-mailVeuillez vérifier votre adresse e-mailVeuillez vérifier votre adresse e-mailVeuillez vérifier votre adresse e-mail',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Styles.normal14.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
