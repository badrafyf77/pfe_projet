// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import 'package:pfe_projet/core/services/firestore_services.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/checkdata/data/repo/checkdata_repo.dart';
import 'package:pfe_projet/features/checkdata/data/service/docscan_api_service.dart';

class CheckDataRepoImplement implements CheckDataRepo {
  // ignore: unused_field
  final DocScanService _docscanService;
  final FirestoreService _firestoreService;

  CheckDataRepoImplement(
    this._docscanService,
    this._firestoreService,
  );

  @override
  Future<Either<Unit, XFile>> getImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final image = await picker.pickImage(source: source);

      if (image != null) {
        return right(image);
      } else {
        return left(unit);
      }
    } catch (e) {
      return left(unit);
    }
  }

  @override
  Future<Either<Failure, bool>> checkCin(String base64) async {
    try {
      // _docscanService.getCin(base64);
      await _firestoreService.updateStatuCin(true);
      return right(true);
    } catch (e) {
      return left(FirebaseAuthFailure(errMessage: "errMessage"));
    }
  }
}
