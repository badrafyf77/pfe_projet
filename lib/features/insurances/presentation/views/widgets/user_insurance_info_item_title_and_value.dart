import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_dialog.dart';

class UserInsuranceItemTitleAndValue extends StatelessWidget {
  const UserInsuranceItemTitleAndValue({
    Key? key,
    required this.maxWidth,
    required this.title,
    required this.value,
  }) : super(key: key);

  final double maxWidth;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: maxWidth * 0.48,
            child: Text(
              title,
              style: Styles.normal14.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            ':',
            style: Styles.normal14.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: maxWidth * 0.48,
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  customShowDialog(
                    context,
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          value,
                          style: Styles.normal14.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  value,
                  style: Styles.normal14.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}