import 'package:flutter/material.dart';
import 'package:pfe_projet/core/configures/styles.dart';
import 'package:pfe_projet/core/utils/customs/custom_normal_button.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/settings/presentation/views/widgets/user_info_item_verified.dart';

class AutoDocumentsView extends StatelessWidget {
  const AutoDocumentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: 'Devis',
      ),
      body: AutoDocumentsBody(),
    );
  }
}

class AutoDocumentsBody extends StatelessWidget {
  const AutoDocumentsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
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
              isVerified: false,
              noTitle: true,
              value: 'Carte Grise',
              onPressed: () async {
                // await AppRouter.navigateToAndDoSomethingWithExtra(
                //   context,
                //   AppRouter.pickfileView,
                //   state.userInformation.cin,
                //   (_) {
                //     BlocProvider.of<GetUserCubit>(context).getUserCubit();
                //   },
                // );
              },
            ),
            const SizedBox(height: 20),
            ItemVerified(
              isVerified: false,
              noTitle: true,
              value: 'Permis de conduite (recto)',
              onPressed: () async {},
            ),
            const SizedBox(height: 20),
            ItemVerified(
              isVerified: false,
              noTitle: true,
              value: 'Permis de conduite (verso)',
              onPressed: () async {},
            ),
            const SizedBox(height: 50),
            CustomNormalButton(
              onPressed: () {},
              textButton: 'Terminer',
              backgroundColor: Theme.of(context).colorScheme.primary,
              height: 45,
              width: 120,
            )
          ],
        ),
      ),
    );
  }
}
