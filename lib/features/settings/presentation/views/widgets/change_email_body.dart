import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/core/utils/helpers/validators.dart';
import 'package:pfe_projet/features/settings/presentation/manager/securite%20bloc/securite_bloc.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/change_field_and_text.dart';

class ChangeEmailBody extends StatefulWidget {
  const ChangeEmailBody({super.key});

  @override
  State<ChangeEmailBody> createState() => _ChangeEmailBodyState();
}

class _ChangeEmailBodyState extends State<ChangeEmailBody> {
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emailConfirmController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SecuriteBloc, SecuriteState>(
      listener: (context, state) {
        if (state is ChangeEmailLoading) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is ChangeEmailFailure) {
          setState(() {
            isLoading = false;
          });
          myShowToastError(
            context,
            state.errorMessage,
          );
        }
        if (state is ChangeEmailSuccess) {
          setState(() {
            isLoading = false;
          });
          myShowToastSuccess(
            context,
            'Votre adresse e-mail a été modifiée avec succès.',
          );
        }
      },
      child: Center(
        child: isLoading
            ? LoadingCircle(
                color: Theme.of(context).colorScheme.primary,
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      SecurityFieldAndTextItem(
                        text: "Votre mot de passe :",
                        passController: passController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrer votre mot de passe';
                          }
                          return null;
                        },
                        obscureText: true,
                        hintText: "mot de passe",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SecurityFieldAndTextItem(
                        text: "Nouvelle adresse :",
                        passController: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrer email';
                          } else if (!isEmailValid(value)) {
                            return 'Entrer un valide email';
                          }
                          return null;
                        },
                        obscureText: false,
                        hintText: "votre adresse",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SecurityFieldAndTextItem(
                        text: "Confirmer l’adresse :",
                        passController: emailConfirmController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrer email';
                          } else if (value != emailController.text) {
                            return 'Email de confirmation doit être égale l\'email';
                          } else if (!isEmailValid(value)) {
                            return 'Entrer un valide email de confirmation';
                          }
                          return null;
                        },
                        obscureText: false,
                        hintText: "adresse confirmation",
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      UnconstrainedBox(
                        child: CustomNormalButton(
                          textButton: "Valider",
                          height: 50,
                          width: 120,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<SecuriteBloc>(context).add(
                                ChangeEmailEvent(
                                  newEmail: emailController.text,
                                  password: passController.text,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
