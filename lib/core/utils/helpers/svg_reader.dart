// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgReader extends StatelessWidget {
  const SvgReader({
    Key? key,
    required this.assetImage,
    required this.defaultSize,
    this.height = 0,
    this.width = 0,
  }) : super(key: key);

  final String assetImage;
  final bool defaultSize;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return (defaultSize) ? SvgPicture.asset(
      assetImage,
    ) : SvgPicture.asset(
      assetImage,
      height: height,
      width: width,
    );
  }
}
