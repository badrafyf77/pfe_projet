// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';

import 'package:pfe_projet/features/insurances/data/model/devis_info.dart';
import 'package:pfe_projet/features/insurances/presentation/manager/stock%20insurance%20bloc/stock_insurance_bloc.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/edit_button_with_desc.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/select_choices_and_button.dart';

class DevisDurationBody extends StatelessWidget {
  const DevisDurationBody({
    Key? key,
    required this.devisInfo,
  }) : super(key: key);

  final DevisInfo devisInfo;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockInsuranceBloc, StockInsuranceState>(
      listener: (context, state) {
        if (state is StockInsuranceFailure) {
          myShowToastError(context, state.err);
        }
        if (state is StockInsuranceSuccess) {
          AppRouter.navigateToWithExtra(
            context,
            AppRouter.insurancesFeature.autoDocumentsView,
            devisInfo.id!,
          );
        }
      },
      builder: (context, state) {
        if (state is StockInsuranceLoading) {
          return Center(
            child: LoadingCircle(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
        return Column(
          children: [
            const Spacer(),
            EditButtonWithGaranties(
              devisInfo: devisInfo,
            ),
            SelectOffersWithButton(
              devisInfo: devisInfo,
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
