import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_text_button.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/features/auth/presentation/manager/check%20email%20cubit/check_email_cubit.dart';

class CheckEmailBlurContainerBody extends StatelessWidget {
  const CheckEmailBlurContainerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckEmailCubit, CheckEmailState>(
      listener: (context, state) {
        if (state is CheckEmailSuccess) {
          myShowToast(context, 'Email vérifié avec succès', Colors.green);
          AppRouter.navigateOff(context, AppRouter.homeFeature.homeView);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: [
            Text(
              'Vérifier votre email',
              style: Styles.normal24,
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                text: 'Un lien de vérification par e-mail envoyé à ',
                style: Styles.normal16,
                children: <TextSpan>[
                  TextSpan(
                    text: FirebaseAuth.instance.currentUser!.email,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomTextButton(
                text: 'Renvoyer le lien',
                onpressed: () {
                  BlocProvider.of<CheckEmailCubit>(context).checkEmailCubit();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
