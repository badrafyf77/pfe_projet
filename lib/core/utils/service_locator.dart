import 'package:get_it/get_it.dart';
import 'package:pfe_projet/core/model/services/firebase_services.dart';
import 'package:pfe_projet/features/auth/data/auth_service.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo_implement.dart';
import 'package:pfe_projet/features/settings/data/repo/user_info_repo_implement.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthService>(
    AuthService(),
  );
  getIt.registerSingleton<FirebaseService>(
    FirebaseService(),
  );
  getIt.registerSingleton<AuthRepoImplement>(
    AuthRepoImplement(
      getIt.get<AuthService>(),
      getIt.get<FirebaseService>(),
    ),
  );
  getIt.registerSingleton<UserInfoRepoImplement>(
    UserInfoRepoImplement(
      getIt.get<FirebaseService>(),
    ),
  );
}
