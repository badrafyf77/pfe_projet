import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/configures/app_router.dart';
import 'package:pfe_projet/core/utils/customs/custom_loading_circle.dart';
import 'package:pfe_projet/core/utils/helpers/custom_show_toast.dart';
import 'package:pfe_projet/features/settings/presentation/manager/get%20user%20cubit/get_user_cubit.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/user_info_item.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/user_info_item_verified.dart';

class UserInfoBody extends StatelessWidget {
  const UserInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCubit, GetUserState>(
      builder: (context, state) {
        if (state is GetUserFailure) {
          myShowToastError(context, state.errorMessage,);
        }
        if (state is GetUserSuccess) {
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .75,
              child: Column(
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  UserInfoItem(
                    title: "Nom et prénom :",
                    value:
                        "${state.userInformation.nom} ${state.userInformation.prenom}",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  UserInfoItemVerified(
                    title: "Email :",
                    value: state.userInformation.email,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  UserInfoItemVerified(
                    title: "Numéro du téléphone :",
                    value: state.userInformation.phone,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  UserInfoItemVerified(
                    title: "CIN :",
                    value: state.userInformation.cin,
                    onPressed: () {
                      AppRouter.navigateTo(context, AppRouter.pickfileView);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const UserInfoItem(
                    title: "Date de naissance :",
                    value: "18 - 05 - 2003",
                  ),
                ],
              ),
            ),
          );
        }
        print("nothing");
        return Center(
          child: LoadingCircle(
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }
}
