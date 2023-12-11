import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlurContineraBackButton extends StatelessWidget {
  const BlurContineraBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 30,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.5),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
          ),
        ),
      ),
    );
  }
}
