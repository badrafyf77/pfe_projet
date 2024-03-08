import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/utils/customs/custom_gradient_button.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/features/auth/presentation/views/manager/auth%20bloc/auth_bloc.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_text_and_textfield.dart';

class ForgotPassblurContainerBody extends StatefulWidget {
  const ForgotPassblurContainerBody({super.key});

  @override
  State<ForgotPassblurContainerBody> createState() =>
      _ForgotPassblurContainerBodyState();
}

class _ForgotPassblurContainerBodyState
    extends State<ForgotPassblurContainerBody> {
  TextEditingController emailController = TextEditingController();

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ForgotPassLoading) {
          setState(() {
            _isLoading = true;
          });
        } else if (state is ForgotPassSuccess) {
          setState(() {
            _isLoading = false;
          });
          myShowToast(
              context,
              "lien de réinitialiser le mot de passe envoyer avec succès",
              Colors.green);
        } else if (state is ForgotPassFailure) {
          setState(() {
            _isLoading = false;
          });
          myShowToast(context, state.errorMessage, Colors.red);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
        child: Column(
          children: [
            Text(
              'Mot de passe oublier ?',
              style: Styles.normal24,
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              'Veuillez saisir votre email de connexion afin de recevoir un lien de réinitialisation de votre mot de passe',
              style: Styles.normal14,
            ),
            const SizedBox(
              height: 30,
            ),
            TextAndTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Entrer email';
                }
                return null;
              },
              text: 'Email de connexion',
              hintText: 'Saisir votre email',
              controller: emailController,
              isPassField: false,
              prefixIcon: Icons.mail,
            ),
            const SizedBox(
              height: 80,
            ),
            _isLoading
                ? const LoadingCircle()
                : CustomGradientButton(
                    text: 'Recevoir le lien',
                    width: 150,
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(
                        ForgotPassEvent(email: emailController.text),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("My title"),
    content: const Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
