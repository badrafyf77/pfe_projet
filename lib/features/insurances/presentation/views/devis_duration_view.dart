import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/devis_blur_container.dart';
import 'package:provider/provider.dart';

class DevisDurationView extends StatelessWidget {
  const DevisDurationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: 'Devis',
      ),
      body: DevisBlurContainer(child: DevisDurationBody()),
    );
  }
}

class DevisDurationBody extends StatelessWidget {
  const DevisDurationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditButtonWithText(),
          SizedBox(
            height: 25,
          ),
          DescriptionsText(),
        ],
      ),
    );
  }
}

class DescriptionsText extends StatelessWidget {
  const DescriptionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Responsabilité civile',
          style: Styles.normal24.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'la responsabilité civile est la garantie minimum obligatoire qui couvre les dommages causés aux tiers',
          style: Styles.normal14.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              '3011.60 DH',
              style: Styles.normal14.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Tarif TTC/12 mois',
              style: Styles.normal8.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class EditButtonWithText extends StatelessWidget {
  const EditButtonWithText({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              'Votre Devis Itus oTo :',
              style: Styles.normal12.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '6 CV - Diesel',
              style: Styles.normal20.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        CustomNormalButton(
          onPressed: () {},
          textButton: "MODIFIER",
          backgroundColor: themeChange.darkTheme
              ? AppColors.kThirdColor
              : Theme.of(context).colorScheme.primary,
          textColor: themeChange.darkTheme
              ? Theme.of(context).colorScheme.primary
              : AppColors.kThirdColor,
          height: 45,
          width: 82,
        ),
      ],
    );
  }
}
