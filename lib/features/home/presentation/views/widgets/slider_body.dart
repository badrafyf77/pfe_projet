// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/utils/customs/horizontal_line.dart';
import 'package:pfe_projet/core/utils/service_locator.dart';
import 'package:pfe_projet/features/home/data/model/home_preferences.dart';
import 'package:pfe_projet/features/home/presentation/manager/messages%20checker/home_preferences_cubit.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/slider_item_and_icon.dart';

class SliderBody extends StatefulWidget {
  const SliderBody({
    Key? key,
  }) : super(key: key);

  @override
  State<SliderBody> createState() => _SliderBodyState();
}

class _SliderBodyState extends State<SliderBody> {
  bool? isMessagesReaded;

  @override
  void initState() {
    getisMessagesReaded();
    super.initState();
  }

  getisMessagesReaded() async {
    isMessagesReaded = await getIt.get<HomePreferences>().getIsMessagesReaded();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HorizontalLine(),
        SliderItem(
          onPressed: () {},
          icon: Icons.home,
          text: 'Acceuil',
        ),
        const HorizontalLine(),
        SliderItem(
          onPressed: () {},
          icon: Icons.person,
          text: 'Mon Conseiller',
        ),
        const HorizontalLine(),
        SliderItem(
          onPressed: () {},
          icon: Icons.mail,
          text: 'Email',
        ),
        const HorizontalLine(),
        SliderItem(
          isMessagesReaded: isMessagesReaded!,
          onPressed: () async {
            await AppRouter.navigateToAndDoSomething(
              context,
              AppRouter.homeFeature.notificationView,
              (_) {
                BlocProvider.of<HomePreferencesCubit>(context)
                    .getHomePreferences();
              },
            );
          },
          icon: Icons.notifications,
          text: 'Messagerie',
        ),
        const HorizontalLine(),
        SliderItem(
          icon: Icons.settings,
          text: 'Paramètres',
          onPressed: () async {
            await AppRouter.navigateToAndDoSomething(
              context,
              AppRouter.settingsFeature.settingsView,
              (_) {
                BlocProvider.of<HomePreferencesCubit>(context)
                    .getHomePreferences();
              },
            );
          },
        ),
        const HorizontalLine(),
      ],
    );
  }
}
