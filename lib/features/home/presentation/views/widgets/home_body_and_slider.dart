// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/features/home/presentation/manager/cin%20checker/cin_checker_cubit.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/home_body.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/home_slider.dart';

class HomeBodyAndSlider extends StatelessWidget {
  const HomeBodyAndSlider({
    super.key,
  });

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
                if (!state.isCinVerified)
                  Container(
                    height: 30,
                    color: Colors.yellow,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        const Icon(
                          Icons.warning_amber,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Please vefefied your CIN',
                          style: Styles.normal14.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
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
