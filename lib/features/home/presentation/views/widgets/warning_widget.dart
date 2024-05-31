import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';

class WarningWidget extends StatelessWidget {
  const WarningWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Colors.yellow,
      child: Row(
        children: [
          const SizedBox(
            width: 40,
          ),
          const Icon(
            Icons.warning_amber,
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Please vefefied your CIN',
            style: Styles.normal14.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
