// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pfe_projet/features/home/presentation/manager/cin%20checker/cin_checker_cubit.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/home_body.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/home_slider.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/warning_widget.dart';

class HomeBodyAndSlider extends StatefulWidget {
  const HomeBodyAndSlider({
    super.key,
  });

  @override
  State<HomeBodyAndSlider> createState() => _HomeBodyAndSliderState();
}

class _HomeBodyAndSliderState extends State<HomeBodyAndSlider> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CinCheckerCubit>(context).getCinStatu();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<SliderDrawerState> sliderDrawerKey =
        GlobalKey<SliderDrawerState>();
    return SliderDrawer(
      appBar: const SizedBox(),
      key: sliderDrawerKey,
      sliderOpenSize: MediaQuery.of(context).size.width * .55,
      sliderCloseSize: 65,
      slider: HomeSlider(
        sliderDrawerKey: sliderDrawerKey,
      ),
      child: BlocBuilder<CinCheckerCubit, CinCheckerState>(
        builder: (context, state) {
          if (state is CinCheckerSuccess) {
            return Column(
              children: [
                if (!state.isCinVerified) const WarningWidget(),
                const Expanded(child: HomeBody()),
              ],
            );
          }
          return const HomeBody();
        },
      ),
    );
  }
}
