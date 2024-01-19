import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgReader extends StatelessWidget {
  const SvgReader({
    Key? key,
    required this.assetImage,
  }) : super(key: key);
  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetImage,
    );
  }
}
