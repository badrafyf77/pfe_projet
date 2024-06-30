import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/list_item.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';

class UserInsuranceItem extends StatelessWidget {
  const UserInsuranceItem({super.key, required this.devisInfo});

  final DevisInfo devisInfo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.navigateToWithExtra(context,
            AppRouter.insurancesFeature.userInsuranceInfoView, devisInfo);
      },
      child: CustomListItem(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assurance auto',
                style: Styles.normal14.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      devisInfo.id!,
                      style: Styles.normal16.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    devisInfo.statu,
                    style: Styles.normal16.copyWith(
                        color: (devisInfo.statu == 'accordé')
                            ? Colors.green
                            : (devisInfo.statu == 'annulée')
                                ? Colors.red
                                : Colors.amber),
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
