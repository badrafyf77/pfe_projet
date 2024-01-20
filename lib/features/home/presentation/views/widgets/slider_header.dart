import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:pfe_projet/features/home/presentation/views/widgets/slider_item_and_icon.dart';

class SliderHeader extends StatelessWidget {
  const SliderHeader({
    Key? key,
    required this.sliderDrawerKey,
    this.onPressedMenu,
  }) : super(key: key);

  final GlobalKey<SliderDrawerState> sliderDrawerKey;
  final void Function()? onPressedMenu;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: SliderIcon(
        onPressed: onPressedMenu,
        icon: Icons.menu,
      ),
    );
  }
}