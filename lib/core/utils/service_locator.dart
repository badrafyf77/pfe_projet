import 'package:get_it/get_it.dart';
import 'package:pfe_projet/core/model/services/firestore_services.dart';
import 'package:pfe_projet/core/model/services/auth_service.dart';
import 'package:pfe_projet/features/auth/data/repo/auth_repo_implement.dart';
import 'package:pfe_projet/features/checkdata/data/repo/checkdata_repo_implementation.dart';
import 'package:pfe_projet/features/checkdata/data/service/docscan_api_service.dart';
import 'package:pfe_projet/features/settings/data/repo/settings_repo_implement.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthService>(
    AuthService(),
  );
  getIt.registerSingleton<FirestoreService>(
    FirestoreService(),
  );
  getIt.registerSingleton<DocScanService>(
    DocScanService(),
  );
  getIt.registerSingleton<AuthRepoImplement>(
    AuthRepoImplement(
      getIt.get<AuthService>(),
      getIt.get<FirestoreService>(),
    ),
  );
  getIt.registerSingleton<SettingsRepoImplement>(
    SettingsRepoImplement(
      getIt.get<FirestoreService>(),
      getIt.get<AuthService>(),
    ),
  );
  getIt.registerSingleton<CheckDataRepoImplement>(
    CheckDataRepoImplement(
      getIt.get<DocScanService>(),
    ),
  );
}
