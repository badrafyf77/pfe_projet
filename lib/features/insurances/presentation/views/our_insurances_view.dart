// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';

class OurInsurancesView extends StatelessWidget {
  const OurInsurancesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Nos Assurances",
      ),
      body: OurInsurancesBody(),
    );
  }
}

class OurInsurancesBody extends StatelessWidget {
  const OurInsurancesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 45,
        horizontal: MediaQuery.of(context).size.width * 0.09,
      ),
      child: BlurContainer(
        height: 240,
        width: MediaQuery.of(context).size.width * 0.82,
        opacity: 0.6,
        blurContainerBody: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.car,
                  size: 43,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 25,
                ),
                Text(
                  'Assurance Auto',
                  style: Styles.normal20.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 35),
              child: Column(
                children: [
                  InsuranceItem(
                    text: "Itus Auto",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  InsuranceItem(
                    text: "Itus Moto",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  InsuranceItem(
                    text: "Itus 90to",
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InsuranceItem extends StatelessWidget {
  const InsuranceItem({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Styles.normal18.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.primary,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
