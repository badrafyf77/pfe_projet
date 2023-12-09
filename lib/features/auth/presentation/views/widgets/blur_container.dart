import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/styles.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/connect_button.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/email_field_and_text.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/google_button.dart';
import 'package:pfe_projet/features/auth/presentation/views/widgets/pass_field_and_text.dart';

class BlurContainer extends StatelessWidget {
  final Size size;
  const BlurContainer({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0XFF827777),
                  Color(0XFFEFC887),
                ],
              ),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 23.0, sigmaY: 25.0),
                child: Opacity(
                  opacity: 0.1,
                  child: Container(
                    width: size.width * .8,
                    height: size.height * .53,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            children: [
              const EmailFields(),
              const SizedBox(
                height: 28,
              ),
              const PassFields(),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Mot de passe oublie?',
                    style: Styles.normal12,
                  ),
                ),
              ),
              GoogleButton(
                size: size,
              ),
              const SizedBox(
                height: 63,
              ),
              const ConnectButton(),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'S\'inscrire?',
                  style: Styles.normal12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
