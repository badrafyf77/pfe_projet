import 'package:get_it/get_it.dart';
import 'package:pfe_projet/core/model/services/firestore_services.dart';
import 'package:pfe_projet/features/auth/data/auth_service.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo_implement.dart';
import 'package:pfe_projet/features/settings/data/repo/securite_repo_implement.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthService>(
    AuthService(),
  );
  getIt.registerSingleton<FirestoreService>(
    FirestoreService(),
  );
  getIt.registerSingleton<AuthRepoImplement>(
    AuthRepoImplement(
      getIt.get<AuthService>(),
      getIt.get<FirestoreService>(),
    ),
  );
  getIt.registerSingleton<SecuriteRepoImplement>(
    SecuriteRepoImplement(
      getIt.get<FirestoreService>(),
    ),
  );
}
