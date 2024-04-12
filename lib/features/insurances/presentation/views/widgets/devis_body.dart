import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/core/utils/dark_mode_logic.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/carburant_row.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/category_gender_row.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/puissancefiscal_text_and_field.dart';
import 'package:provider/provider.dart';

class DevisBody extends StatefulWidget {
  const DevisBody({super.key});

  @override
  State<DevisBody> createState() => _DevisBodyState();
}

class _DevisBodyState extends State<DevisBody> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool dieselValue = false;
  bool essenceValue = false;
  bool hybrideValue = false;
  bool particuliersValue = false;
  bool proValue = false;
  bool maleValue = false;
  bool femaleValue = false;
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          PuissanceFiscalTextAndField(
            controller: controller,
          ),
          const SizedBox(
            height: 24,
          ),
          CarburantRow(
            dieselValue: dieselValue,
            onTapDiesel: (selected) {
              setState(() {
                if (dieselValue == false) {
                  essenceValue = false;
                  hybrideValue = false;
                }
                dieselValue = true;
              });
            },
            essenceValue: essenceValue,
            onTapEssence: (selected) {
              setState(() {
                if (essenceValue == false) {
                  dieselValue = false;
                  hybrideValue = false;
                }
                essenceValue = true;
              });
            },
            hybrideValue: hybrideValue,
            onTapHybride: (selected) {
              setState(() {
                if (hybrideValue == false) {
                  essenceValue = false;
                  dieselValue = false;
                }
                hybrideValue = true;
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          CategoryAndGenderRow(
            text: 'Catégorie',
            firstText: 'Particuliers',
            firstValue: particuliersValue,
            onTapFirst: (selected) {
              setState(() {
                if (particuliersValue == false) {
                  proValue = false;
                }
                particuliersValue = true;
              });
            },
            secondText: 'Professionnel',
            secondValue: proValue,
            onTapSecond: (selected) {
              setState(() {
                if (proValue == false) {
                  particuliersValue = false;
                }
                proValue = true;
              });
            },
          ),
          const SizedBox(
            height: 24,
          ),
          CategoryAndGenderRow(
            text: 'Sex',
            firstText: 'Homme',
            firstValue: maleValue,
            onTapFirst: (selected) {
              setState(() {
                if (maleValue == false) {
                  femaleValue = false;
                }
                maleValue = true;
              });
            },
            secondText: 'Femme',
            secondValue: femaleValue,
            onTapSecond: (selected) {
              setState(() {
                if (femaleValue == false) {
                  maleValue = false;
                }
                femaleValue = true;
              });
            },
          ),
          const Spacer(),
          CustomNormalButton(
            onPressed: () {
              AppRouter.navigateTo(
                  context, AppRouter.insurancesFeature.devisDurationView);
            },
            textButton: "Suivant",
            backgroundColor: themeChange.darkTheme
                ? AppColors.kThirdColor
                : Theme.of(context).colorScheme.primary,
            textColor: themeChange.darkTheme
                ? Theme.of(context).colorScheme.primary
                : AppColors.kThirdColor,
            height: 40,
            width: 100,
          ),
          const Spacer()
        ],
      ),
    );
  }
}
