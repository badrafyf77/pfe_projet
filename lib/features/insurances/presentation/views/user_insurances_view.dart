import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe_projet/core/utils/customs/home_appbar.dart';
import 'package:pfe_projet/features/insurances/presentation/manager/get%20user%20insurances%20cubit/get_user_insurances_cubit.dart';
import 'package:pfe_projet/features/insurances/presentation/views/widgets/user_insurances_body.dart';

class UserInsurancesView extends StatefulWidget {
  const UserInsurancesView({super.key});

  @override
  State<UserInsurancesView> createState() => _UserInsurancesViewState();
}

class _UserInsurancesViewState extends State<UserInsurancesView> {
  @override
  void initState() {
    BlocProvider.of<GetUserInsurancesCubit>(context).getUserInsurances();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppAppBar(
        withHeaderAndBackBar: true,
        title: "Mes Assurances",
      ),
      body: UserInsurancesBody(),
    );
  }
}
