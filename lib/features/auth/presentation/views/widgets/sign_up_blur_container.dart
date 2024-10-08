// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/configures/constants.dart';
import 'package:pfe_projet/core/model/advisor_model.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/core/utils/customs/custom_gradient_button.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/helpers/calcule_signup_container_height.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/core/utils/helpers/validators.dart';
import 'package:pfe_projet/features/auth/presentation/manager/auth bloc/auth_bloc.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/blur_container_back_button.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/custom_text_and_textfield.dart';

class SignUpBlurContainer extends StatefulWidget {
  const SignUpBlurContainer({
    Key? key,
    required this.advisor,
  }) : super(key: key);

  final Advisor advisor;

  @override
  State<SignUpBlurContainer> createState() => _SignUpBlurContainerState();
}

class _SignUpBlurContainerState extends State<SignUpBlurContainer> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController cinController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  double containerHeight = 720;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is SignUpFailure) {
          setState(() {
            isLoading = false;
          });
          myShowToastError(
            context,
            state.errorMessage,
          );
        } else {
          setState(() {
            isLoading = false;
          });
          AppRouter.navigateOff(
            context,
            AppRouter.authFeature.checkEmailView,
          );
        }
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            height: containerHeight,
          ),
          Form(
            key: formKey,
            child: BlurContainer(
              height: containerHeight - 30,
              width: size.width * Constants.blurConatinerWidth,
              blurContainerBody: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: Column(
                  children: [
                    TextAndTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrer nom';
                        } else if (containsNumbers(value)) {
                          return 'Entrer un nom valide';
                        }
                        return null;
                      },
                      text: 'Nom',
                      hintText: 'Nom',
                      controller: nomController,
                      isPassField: false,
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextAndTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrer prenom';
                        } else if (containsNumbers(value)) {
                          return 'Entrer un prenom valide';
                        }
                        return null;
                      },
                      text: 'Prenom',
                      hintText: 'Prenom',
                      controller: prenomController,
                      isPassField: false,
                      prefixIcon: Icons.person,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextAndTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrer CIN';
                        } else if (value.length > 10) {
                          return 'Entrer un CIN valide';
                        }
                        return null;
                      },
                      text: 'Cin',
                      hintText: 'Cin',
                      controller: cinController,
                      isPassField: false,
                      prefixIcon: Icons.contact_mail,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextAndTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrer numéro de téléphone';
                        } else if (!isNumeric(value) || value.length > 14) {
                          return 'Entrer un numéro valide';
                        }
                        return null;
                      },
                      text: 'Numéro de téléphone',
                      hintText: '0612345678',
                      controller: phoneController,
                      isPassField: false,
                      prefixIcon: Icons.phone,
                      justNumbers: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextAndTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrer e-mail';
                        } else if (!isEmailValid(value)) {
                          return 'Entrer un e-mail valide';
                        }
                        return null;
                      },
                      text: 'E-mail',
                      hintText: 'E-mail',
                      controller: emailController,
                      isPassField: false,
                      prefixIcon: Icons.mail,
                    ),
                    const SizedBox(
                      height: 5,
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
                      height: 5,
                    ),
                    TextAndTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrer votre confirmation mot de passe';
                        } else if (value != passController.text) {
                          return 'Mot de passe de confirmation doit être égale le mot de pass';
                        }
                        return null;
                      },
                      text: 'Confirmer le mot de passe',
                      hintText: '++++++++',
                      controller: confirmPassController,
                      isPassField: true,
                      prefixIcon: Icons.lock,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const BlurContineraBackButton(),
          Positioned(
            bottom: 0.5,
            right: 30,
            child: isLoading
                ? const LoadingCircle()
                : CustomGradientButton(
                    text: 'S\'inscrire',
                    width: 134,
                    onPressed: () {
                      setState(() {
                        containerHeight = containerHeightFunction(
                          nomController.text,
                          prenomController.text,
                          cinController.text,
                          phoneController.text,
                          emailController.text,
                          passController.text,
                          confirmPassController.text,
                        );
                      });
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          SignUpEvent(
                            email: emailController.text,
                            password: passController.text,
                            nom: nomController.text,
                            prenom: prenomController.text,
                            cin: cinController.text,
                            phone: phoneController.text,
                            advisor: widget.advisor,
                          ),
                        );
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
