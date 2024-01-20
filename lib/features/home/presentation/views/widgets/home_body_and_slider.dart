import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/home_body.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/home_slider_body.dart';

class HomeBodyAndSlider extends StatelessWidget {
  const HomeBodyAndSlider({
    super.key,
    required GlobalKey<SliderDrawerState> sliderDrawerKey,
  }) : _sliderDrawerKey = sliderDrawerKey;

  final GlobalKey<SliderDrawerState> _sliderDrawerKey;

  @override
  Widget build(BuildContext context) {
    return SliderDrawer(
      appBar: const SizedBox(),
      key: _sliderDrawerKey,
      sliderOpenSize: MediaQuery.of(context).size.width * .55,
      sliderCloseSize: 65,
      slider: HomeSliderBody(
        sliderDrawerKey: _sliderDrawerKey,
      ),
      child: const HomeBody(),
    );
  }
}