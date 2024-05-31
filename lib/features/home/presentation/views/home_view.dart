import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/home/presentation/manager/messages%20checker/messages_checker_cubit.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/home_body_and_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: false,
      ),
      body: HomeBodyAndSlider(),
    );
  }
}
