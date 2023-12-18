import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/configures/app_routers.dart';
import 'package:pfe_projet/core/utils/customs/custom_button.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/customs/custom_text_button.dart';
import 'package:pfe_projet/core/utils/helpers.dart';
import 'package:pfe_projet/features/auth/presentation/views/manager/auth%20bloc/auth_bloc.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_text_and_textfield.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/google_button.dart';

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
          myShowToast(context, state.errorMessage, Colors.red);
        } else if (state is SignInSuccess) {
          setState(() {
            isLoading = false;
          });
          myShowToast(context, 'succes', Colors.green);
          AppRouters.navigateOff(
            AppRouters.otpNumView,
          );
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
                      AppRouters.navigateTo(
                        AppRouters.forgotPassView,
                      );
                    },
                    text: 'Mot de passe oublie?',
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const GoogleButton(),
              const SizedBox(
                height: 40,
              ),
              isLoading
                  ? const LoadingCircle()
                  : CustomButton(
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
                  AppRouters.navigateTo(
                    AppRouters.signUpView,
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
