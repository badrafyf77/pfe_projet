import 'package:flutter/material.dart';
import 'package:pfe_projet/core/utils/customs/blur_container.dart';

Future<dynamic> customShowDialog(BuildContext context, Widget child) {
    return showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext build) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          content: MyBlurContainer(
            height: 180,
            width: 300,
            opacity: 0.6,
            color: Colors.white,
            blurContainerBody: child,
          ),
        );
      },
    );
  }