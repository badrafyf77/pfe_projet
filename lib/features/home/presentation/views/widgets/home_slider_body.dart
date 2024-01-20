import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/slider_body.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/slider_footer.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/slider_header.dart';

class HomeSliderBody extends StatefulWidget {
  const HomeSliderBody({
    Key? key,
    required this.sliderDrawerKey,
  }) : super(key: key);

  final GlobalKey<SliderDrawerState> sliderDrawerKey;

  @override
  State<HomeSliderBody> createState() => _HomeSliderBodyState();
}

class _HomeSliderBodyState extends State<HomeSliderBody> {
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SliderHeader(
            sliderDrawerKey: widget.sliderDrawerKey,
            onPressedMenu: () {
              widget.sliderDrawerKey.currentState!.toggle();
              setState(() {
                isDrawerOpen = !isDrawerOpen;
              });
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