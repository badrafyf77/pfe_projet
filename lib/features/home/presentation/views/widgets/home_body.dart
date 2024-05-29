import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/home_body_item_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const VerticalDivider(
            color: AppColors.kThirdColor,
            thickness: 2,
            width: 2,
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .07,
              ),
              Row(
                children: [
                  HomeBodyItemCard(
                    icon: CupertinoIcons.umbrella_fill,
                    text: "Nos Assurances",
                    onTap: () {
                      AppRouter.navigateTo(context,
                          AppRouter.insurancesFeature.ourInsurancesView);
                    },
                  ),
                  const SizedBox(width: 30),
                  HomeBodyItemCard(
                    icon: Icons.preview,
                    text: "Ch7al d jehd",
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  HomeBodyItemCard(
                    icon: Icons.diamond,
                    text: "Ch7al d jehd",
                    onTap: () {},
                  ),
                  const SizedBox(width: 30),
                  HomeBodyItemCard(
                    icon: Icons.pinch,
                    text: "Ch7al d jehd",
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  HomeBodyItemCard(
                    icon: Icons.assignment_turned_in,
                    text: "Ch7al d jehd",
                    onTap: () {},
                  ),
                  const SizedBox(width: 30),
                  HomeBodyItemCard(
                    icon: Icons.place,
                    text: "Géolocalisation",
                    onTap: () {
                      AppRouter.navigateTo(context, AppRouter.flutterMapView);
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .15,
          ),
        ],
      ),
    );
  }
}
