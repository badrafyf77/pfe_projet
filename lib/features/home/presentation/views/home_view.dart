import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/features/home/presentation/manager/messages%20checker/home_preferences_cubit.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/home_body_and_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<HomePreferencesCubit>(context).getHomePreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        withHeaderAndBackBar: false,
      ),
      body: BlocBuilder<HomePreferencesCubit, HomePreferencesState>(
        builder: (context, state) {
          if (state is HomePreferencesFailure) {
            myShowToastError(context, state.err);
          }
          if (state is HomePreferencesSuccess) {
            return HomeBodyAndSlider(
              
            );
          }
          return LoadingCircle(
            color: Theme.of(context).colorScheme.primary,
          );
        },
      ),
    );
  }
}
