import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/utils/customs/custom_gradient_button.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/customs/custom_text_button.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/core/utils/helpers/validators.dart';
import 'package:pfe_projet/features/auth/presentation/manager/auth%20bloc/auth_bloc.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_text_and_textfield.dart';

class SignInBlurContainerBody extends StatefulWidget {
  const SignInBlurContainerBody({
    super.key,
  });

  @override
  State<SignInBlurContainerBody> createState() =>
      _SignInBlurContainerBodyState();
}

class _SignInBlurContainerBodyState extends State<SignInBlurContainerBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is SignInFailure) {
          setState(() {
            isLoading = false;
          });
          myShowToastError(
            context,
            state.errorMessage,
          );
        } else if (state is SignInSuccess) {
          setState(() {
            isLoading = false;
          });
          myShowToastSuccess(
            context,
            'succes',
          );
          AppRouter.navigateOff(context, AppRouter.homeFeature.homeView);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextAndTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer email';
                  } else if (!isEmailValid(value)) {
                    return 'Entrer un e-mail valide';
                  }
                  return null;
                },
                text: 'Email',
                hintText: 'example@gmail.com',
                controller: emailController,
                isPassField: false,
                prefixIcon: Icons.mail,
              ),
              const SizedBox(
                height: 8,
              ),
              TextAndTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer votre mot de passe';
                  } else if (value.length < 8) {
                    return 'Mot de passe doit être d\'au moins 8 caractères';
                  }
                  return null;
                },
                text: 'Mot de passe',
                hintText: '++++++++',
                controller: passController,
                isPassField: true,
                prefixIcon: Icons.lock,
              ),
              const SizedBox(
                height: 2,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 30,
                  child: CustomTextButton(
                    onpressed: () {
                      AppRouter.navigateTo(
                        context,
                        AppRouter.authFeature.forgotPassView,
                      );
                    },
                    text: 'Mot de passe oublie?',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              isLoading
                  ? const LoadingCircle()
                  : CustomGradientButton(
                      text: 'Se connecter',
                      width: 143,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                            SignInEvent(
                              email: emailController.text,
                              password: passController.text,
                            ),
                          );
                        }
                      },
                    ),
              const SizedBox(
                height: 8,
              ),
              CustomTextButton(
                onpressed: () {
                  AppRouter.navigateTo(
                    context,
                    AppRouter.authFeature.selectAgenceView,
                  );
                },
                text: 'S\'inscrire?',
              )
            ],
          ),
        ),
      ),
    );
  }
}
