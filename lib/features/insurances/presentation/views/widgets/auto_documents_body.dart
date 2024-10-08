import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/features/checkdata/data/model/document.dart';
import 'package:pfe_projet/features/insurances/presentation/manager/get%20auto%20insurance%20cubit/get_auto_insurance_cubit.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/user_info_item_verified.dart';

class AutoDocumentsBody extends StatefulWidget {
  const AutoDocumentsBody({super.key, required this.id});

  final String id;

  @override
  State<AutoDocumentsBody> createState() => _AutoDocumentsBodyState();
}

class _AutoDocumentsBodyState extends State<AutoDocumentsBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAutoInsuranceCubit>(context).getInsurance(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<GetAutoInsuranceCubit, GetAutoInsuranceState>(
        builder: (context, state) {
          if (state is GetAutoInsuranceFailure) {
            return IconButton(
                onPressed: () {
                  BlocProvider.of<GetAutoInsuranceCubit>(context)
                      .getInsurance(widget.id);
                },
                icon: const Icon(Icons.refresh));
          }
          if (state is GetAutoInsuranceSuccess) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * .75,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'Voici les documents que vous devez fournir pour finaliser votre demande : ',
                    style: Styles.normal16.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 30),
                  ItemVerified(
                    isVerified: state.devisInfo.carteGriseRectoVerified,
                    noTitle: true,
                    value: 'Carte Grise(recto)',
                    onPressed: () async {
                      Document document = Document(
                          id: widget.id, documentName: 'Carte Grise(recto)');
                      await AppRouter.navigateToAndDoSomethingWithExtra(
                        context,
                        AppRouter.pickfileView,
                        document,
                        (_) {
                          BlocProvider.of<GetAutoInsuranceCubit>(context)
                              .getInsurance(widget.id);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ItemVerified(
                    isVerified: state.devisInfo.carteGriseVersoVerified,
                    noTitle: true,
                    value: 'Carte Grise(verso)',
                    onPressed: () async {
                      Document document = Document(
                          id: widget.id, documentName: 'Carte Grise(verso)');
                      await AppRouter.navigateToAndDoSomethingWithExtra(
                        context,
                        AppRouter.pickfileView,
                        document,
                        (_) {
                          BlocProvider.of<GetAutoInsuranceCubit>(context)
                              .getInsurance(widget.id);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ItemVerified(
                    isVerified: state.devisInfo.permisRectoVerified,
                    noTitle: true,
                    value: 'Permis de conduite (recto)',
                    onPressed: () async {
                      Document document = Document(
                          id: widget.id, documentName: 'Permis(recto)');
                      await AppRouter.navigateToAndDoSomethingWithExtra(
                        context,
                        AppRouter.pickfileView,
                        document,
                        (_) {
                          BlocProvider.of<GetAutoInsuranceCubit>(context)
                              .getInsurance(widget.id);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ItemVerified(
                    isVerified: state.devisInfo.permisVersoVerified,
                    noTitle: true,
                    value: 'Permis de conduite (verso)',
                    onPressed: () async {
                      Document document = Document(
                          id: widget.id, documentName: 'Permis(verso)');
                      await AppRouter.navigateToAndDoSomethingWithExtra(
                        context,
                        AppRouter.pickfileView,
                        document,
                        (_) {
                          BlocProvider.of<GetAutoInsuranceCubit>(context)
                              .getInsurance(widget.id);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  CustomNormalButton(
                    onPressed: () async {
                      if (state.devisInfo.carteGriseRectoVerified &&
                          state.devisInfo.carteGriseVersoVerified &&
                          state.devisInfo.permisRectoVerified &&
                          state.devisInfo.permisVersoVerified) {
                        AppRouter.navigateTo(
                            context, AppRouter.homeFeature.homeView);
                      }
                    },
                    textButton: 'Terminer',
                    backgroundColor: (state.devisInfo.carteGriseRectoVerified &&
                            state.devisInfo.carteGriseVersoVerified &&
                            state.devisInfo.permisRectoVerified &&
                            state.devisInfo.permisVersoVerified)
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                    textColor: (state.devisInfo.carteGriseRectoVerified &&
                            state.devisInfo.carteGriseVersoVerified &&
                            state.devisInfo.permisRectoVerified &&
                            state.devisInfo.permisVersoVerified)
                        ? Colors.grey
                        : Theme.of(context).colorScheme.primary,
                    height: 45,
                    width: 120,
                  )
                ],
              ),
            );
          }
          return LoadingCircle(
            color: Theme.of(context).colorScheme.primary,
          );
        },
      ),
    );
  }
}
