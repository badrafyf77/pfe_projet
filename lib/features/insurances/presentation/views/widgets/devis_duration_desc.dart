import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_dialog.dart';
import 'package:pfe_projet/features/insurances/data/helpers/calcul_tarifs.dart';
import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';

class DurationViewGarantiesList extends StatelessWidget {
  const DurationViewGarantiesList({super.key, required this.devisInfo});

  final DevisInfo devisInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  devisInfo.garantiesList![0].title,
                  style: Styles.normal24.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (devisInfo.garantiesList!.length > 1)
                IconButton(
                  onPressed: () {
                    customShowDialog(
                      context,
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                            child: Expanded(
                          child: ListView.builder(
                            itemCount: devisInfo.garantiesList!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    devisInfo.garantiesList![index].title,
                                    style: Styles.normal14.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    devisInfo.garantiesList![index].description,
                                    style: Styles.normal12.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              );
                            },
                          ),
                        )),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.more_horiz,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            devisInfo.garantiesList![0].description,
            style: Styles.normal14.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                '${calcul12MonthTarif(devisInfo.garantiesList!)} DH',
                style: Styles.normal14.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Tarif TTC/12 mois',
                style: Styles.normal8.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
