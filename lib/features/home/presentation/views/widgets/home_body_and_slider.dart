import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/home_body.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/home_slider_body.dart';

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
      slider: HomeSliderBody(
        sliderDrawerKey: sliderDrawerKey,
      ),
      child: const HomeBody(),
    );
  }
}
