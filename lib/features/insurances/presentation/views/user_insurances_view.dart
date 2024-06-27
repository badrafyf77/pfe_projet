import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/core/utils/customs/list_item.dart';

class UserInsurancesView extends StatelessWidget {
  const UserInsurancesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Mes Assurances",
      ),
      body: UserInsurancesBody(),
    );
  }
}

class UserInsurancesBody extends StatelessWidget {
  const UserInsurancesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
        itemCount: 4,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        },
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (index == 0) const SizedBox(height: 20),
              const InsuranceItem(),
            ],
          );
        },
      ),
    );
  }
}

class InsuranceItem extends StatelessWidget {
  const InsuranceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListItem(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Assurance auto',
              style: Styles.normal14.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'CIN+DC+ID',
                    style: Styles.normal16.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'en cours de traitement',
                  style: Styles.normal16.copyWith(color: Colors.green),
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
