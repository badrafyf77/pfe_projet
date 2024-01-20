import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'package:pfe_projet/core/configures/app_colors.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_logo_and_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: HomeBodyAndSlider(sliderDrawerKey: _sliderDrawerKey),
    );
  }
}

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

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kPrimaryColor,
      toolbarHeight: 150,
      elevation: 0,
      title: const Column(
        children: [
          SizedBox(
            height: 40,
          ),
          LogoAndText(
            alignment: MainAxisAlignment.center,
            height: 49.62,
            width: 39.62,
          ),
        ],
      ),
      bottom: const HorizontalLine(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kSecondColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const VerticalDivider(
            color: AppColors.kThirdColor,
            thickness: 3,
            width: 3,
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .07,
              ),
              Row(
                children: [
                  HomeBodyItemCard(
                    icon: Icons.person,
                    text: "Ch7al d jehd",
                    onTap: () {},
                  ),
                  const SizedBox(width: 30),
                  HomeBodyItemCard(
                    icon: Icons.preview,
                    text: "Ch7al d jehd",
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  HomeBodyItemCard(
                    icon: Icons.diamond,
                    text: "Ch7al d jehd",
                    onTap: () {},
                  ),
                  const SizedBox(width: 30),
                  HomeBodyItemCard(
                    icon: Icons.pinch,
                    text: "Ch7al d jehd",
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  HomeBodyItemCard(
                    icon: Icons.assignment_turned_in,
                    text: "Ch7al d jehd",
                    onTap: () {},
                  ),
                  const SizedBox(width: 30),
                  HomeBodyItemCard(
                    icon: Icons.phone,
                    text: "Ch7al d jehd",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .15,
          ),
        ],
      ),
    );
  }
}

class HomeBodyItemCard extends StatelessWidget {
  const HomeBodyItemCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: const GradientBoxBorder(
            gradient: LinearGradient(
              colors: AppColors.gradientColors,
            ),
            width: 1,
          ),
          color: const Color(0xFFFBF6ED),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              blurRadius: 7,
              offset: const Offset(7, 9),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: AppColors.kPrimaryColor,
              ),
              Text(
                text,
                style: Styles.normal12,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class SliderFooter extends StatelessWidget {
  const SliderFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SliderItem(
          onPressed: () {},
          icon: CupertinoIcons.moon_fill,
          text: 'Mode Claire',
        ),
        SliderItem(
          onPressed: () {},
          icon: CupertinoIcons.power,
          text: 'Déconnexion',
        ),
      ],
    );
  }
}

class SliderBody extends StatelessWidget {
  const SliderBody({
    super.key,
  });

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
          onPressed: () {},
          icon: Icons.notifications,
          text: 'Messagerie',
        ),
        const HorizontalLine(),
        SliderItem(
          onPressed: () {},
          icon: Icons.settings,
          text: 'Paramètes',
        ),
        const HorizontalLine(),
      ],
    );
  }
}

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

class HorizontalLine extends StatelessWidget implements PreferredSizeWidget {
  const HorizontalLine({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(0.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0.0),
      child: Container(
        color: AppColors.kThirdColor,
        height: 1.5,
      ),
    );
  }
}

class SliderIcon extends StatelessWidget {
  const SliderIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: AppColors.kThirdColor,
          size: 28,
        ),
      ),
    );
  }
}

class SliderItem extends StatelessWidget {
  const SliderItem({
    Key? key,
    required this.icon,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SliderIcon(icon: icon, onPressed: onPressed),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: Styles.normal14.copyWith(color: AppColors.kThirdColor),
        ),
      ],
    );
  }
}
