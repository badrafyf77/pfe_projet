import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:provider/provider.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/devis_blur_container.dart';

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
    return const Column(
      children: [
        Spacer(),
        EditButtonWithDescription(),
        SelectOffersWithButton(),
        Spacer(),
      ],
    );
  }
}

class SelectOffersWithButton extends StatefulWidget {
  const SelectOffersWithButton({
    super.key,
  });

  @override
  State<SelectOffersWithButton> createState() => _SelectOffersWithButtonState();
}

class _SelectOffersWithButtonState extends State<SelectOffersWithButton> {
  bool offer1 = true;
  bool offer2 = false;
  bool offer3 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DevisDurationChoices(
          offer1: offer1,
          onTapOffer1: (selected) {
            setState(() {
              offer1 = true;
              offer2 = false;
              offer3 = false;
            });
          },
          offer2: offer2,
          onTapOffer2: (selected) {
            setState(() {
              offer1 = false;
              offer2 = true;
              offer3 = false;
            });
          },
          offer3: offer3,
          onTapOffer3: (selected) {
            setState(() {
              offer1 = false;
              offer2 = false;
              offer3 = true;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomNormalButton(
          onPressed: () {},
          textButton: "SUIVANT",
          backgroundColor: Theme.of(context).colorScheme.primary,
          textColor: AppColors.kThirdColor,
          height: 40,
          width: 100,
        ),
      ],
    );
  }
}

class EditButtonWithDescription extends StatelessWidget {
  const EditButtonWithDescription({
    super.key,
  });

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
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class DevisDurationChoices extends StatelessWidget {
  const DevisDurationChoices({
    Key? key,
    required this.offer1,
    this.onTapOffer1,
    required this.offer2,
    this.onTapOffer2,
    required this.offer3,
    this.onTapOffer3,
  }) : super(key: key);

  final bool offer1;
  final Function(bool?)? onTapOffer1;
  final bool offer2;
  final Function(bool?)? onTapOffer2;
  final bool offer3;
  final Function(bool?)? onTapOffer3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DevisDCheckBox(
          devisDuration: '12 MOIS',
          price: '3011.60 DH',
          value: offer1,
          onTap: onTapOffer1,
        ),
        const SizedBox(
          width: 15,
        ),
        DevisDCheckBox(
          devisDuration: '06 MOIS',
          price: '1505.80 DH',
          value: offer2,
          onTap: onTapOffer2,
        ),
        const SizedBox(
          width: 15,
        ),
        DevisDCheckBox(
          devisDuration: '03 MOIS',
          price: '760.30 DH',
          value: offer3,
          onTap: onTapOffer3,
        ),
      ],
    );
  }
}

class DevisDCheckBox extends StatelessWidget {
  const DevisDCheckBox({
    Key? key,
    required this.devisDuration,
    required this.price,
    this.onTap,
    required this.value,
  }) : super(key: key);

  final String devisDuration;
  final String price;
  final Function(bool?)? onTap;
  final bool value;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      height: 75,
      width: 65,
      decoration: BoxDecoration(
        color: value
            ? Theme.of(context).colorScheme.primary
            : themeChange.darkTheme
                ? AppColors.kThirdColor
                : Theme.of(context).colorScheme.secondary,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 12,
            width: 12,
            child: Checkbox(
              value: value,
              onChanged: onTap,
              shape: const CircleBorder(),
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              splashRadius: 4,
              activeColor: AppColors.kThirdColor,
              checkColor: AppColors.kThirdColor,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            devisDuration,
            style: Styles.normal8.copyWith(
              color: value
                  ? AppColors.kThirdColor
                  : Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            price,
            style: Styles.normal8.copyWith(
              color: value
                  ? AppColors.kThirdColor
                  : Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer()
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
          height: 15,
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
          backgroundColor: Theme.of(context).colorScheme.primary,
          textColor: AppColors.kThirdColor,
          height: 45,
          width: 82,
        ),
      ],
    );
  }
}
