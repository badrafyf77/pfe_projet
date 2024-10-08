// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/slider_body.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/slider_footer.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/slider_header.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({
    super.key,
    required this.sliderDrawerKey,
  });

  final GlobalKey<SliderDrawerState> sliderDrawerKey;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SliderHeader(
            sliderDrawerKey: sliderDrawerKey,
            onPressedMenu: () {
              sliderDrawerKey.currentState!.toggle();
            },
          ),
          const SliderBody(),
          const Spacer(),
          const SliderFooter(),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

}
