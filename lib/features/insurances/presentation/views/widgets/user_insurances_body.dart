import 'package:flutter/material.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/user_insurance_item.dart';

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
              const UserInsuranceItem(),
            ],
          );
        },
      ),
    );
  }
}