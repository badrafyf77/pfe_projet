import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/carburant_row.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/category_gender_row.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/puissancefiscal_text_and_field.dart';

class DevisInfoBody extends StatefulWidget {
  const DevisInfoBody({super.key});

  @override
  State<DevisInfoBody> createState() => _DevisInfoBodyState();
}

class _DevisInfoBodyState extends State<DevisInfoBody> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool dieselValue = true;
  bool essenceValue = false;
  bool hybrideValue = false;
  bool particuliersValue = true;
  bool proValue = false;
  bool maleValue = true;
  bool femaleValue = false;
  @override
  Widget build(BuildContext context) {
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
                dieselValue = true;
                essenceValue = false;
                hybrideValue = false;
              });
            },
            essenceValue: essenceValue,
            onTapEssence: (selected) {
              setState(() {
                essenceValue = true;
                dieselValue = false;
                hybrideValue = false;
              });
            },
            hybrideValue: hybrideValue,
            onTapHybride: (selected) {
              setState(() {
                hybrideValue = true;
                essenceValue = false;
                dieselValue = false;
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
                  context, AppRouter.insurancesFeature.garantiesView);
            },
            textButton: "SUIVANT",
            backgroundColor: Theme.of(context).colorScheme.primary,
            textColor: AppColors.kThirdColor,
            height: 40,
            width: 100,
          ),
          const Spacer()
        ],
      ),
    );
  }
}
