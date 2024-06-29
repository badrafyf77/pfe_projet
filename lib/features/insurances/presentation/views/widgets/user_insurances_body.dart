import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/features/insurances/presentation/manager/get%20user%20insurances%20cubit/get_user_insurances_cubit.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/user_insurance_item.dart';

class UserInsurancesBody extends StatelessWidget {
  const UserInsurancesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserInsurancesCubit, GetUserInsurancesState>(
      builder: (context, state) {
        if (state is GetUserInsurancesFailure) {
          myShowToastError(context, state.err);
          return Center(
              child: IconButton(
                  onPressed: () {
                    BlocProvider.of<GetUserInsurancesCubit>(context)
                        .getUserInsurances();
                  },
                  icon: const Icon(Icons.refresh)));
        }
        if (state is GetUserInsurancesSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.separated(
              itemCount: state.devisList.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 15);
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index == 0) const SizedBox(height: 20),
                    UserInsuranceItem(
                      devisInfo: state.devisList[index],
                    ),
                  ],
                );
              },
            ),
          );
        }
        return Center(
          child: LoadingCircle(
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }
}
