import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';

class DevisView extends StatelessWidget {
  const DevisView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: 'Devis',
      ),
      body: DevisBlurContainer(),
    );
  }
}

class DevisBlurContainer extends StatelessWidget {
  const DevisBlurContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        top: 75,
      ),
      child: BlurContainer(
        height: size.height * .5,
        width: size.width * .7,
        opacity: 0.6,
        blurContainerBody: const DevisBody(),
      ),
    );
  }
}

class DevisBody extends StatelessWidget {
  const DevisBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
