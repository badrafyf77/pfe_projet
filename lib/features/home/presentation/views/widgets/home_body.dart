import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/features/home/presentation/manager/cin%20checker/cin_checker_cubit.dart';
import 'package:pfe_projet/features/home/presentation/manager/messages%20checker/messages_checker_cubit.dart';
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
                    onTap: () async {
                      await AppRouter.navigateToAndDoSomething(
                        context,
                        AppRouter.insurancesFeature.ourInsurancesView,
                        (_) {
                          BlocProvider.of<MessagesCheckerCubit>(context)
                              .getMessagesStatu();
                          BlocProvider.of<CinStatuCubit>(context).getCinStatu();
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 30),
                  HomeBodyItemCard(
                    icon: Icons.verified_user,
                    text: "Mes Assurances",
                    onTap: () {
                      AppRouter.navigateTo(context,
                          AppRouter.insurancesFeature.userInsurancesView);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  HomeBodyItemCard(
                    icon: Icons.monetization_on,
                    text: "Simulation",
                    onTap: () {},
                  ),
                  const SizedBox(width: 30),
                  HomeBodyItemCard(
                    icon: Icons.place,
                    text: "Géolocalisation",
                    onTap: () async {
                      await AppRouter.navigateToAndDoSomething(
                        context,
                        AppRouter.flutterMapView,
                        (_) {
                          BlocProvider.of<MessagesCheckerCubit>(context)
                              .getMessagesStatu();
                          BlocProvider.of<CinStatuCubit>(context).getCinStatu();
                        },
                      );
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
