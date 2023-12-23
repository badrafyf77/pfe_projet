import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void myShowToast(BuildContext context, String text, Color color) {
  showToast(
    text,
    context: context,
    animation: StyledToastAnimation.slideFromBottomFade,
    borderRadius: BorderRadius.circular(12),
    backgroundColor: color,
  );
}