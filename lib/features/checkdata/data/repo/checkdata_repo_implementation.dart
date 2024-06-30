// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfe_projet/core/services/firestore_services.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/checkdata/data/repo/checkdata_repo.dart';

class CheckDataRepoImplement implements CheckDataRepo {
  final FirestoreService _firestoreService;

  CheckDataRepoImplement(
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
  Future<Either<Failure, bool>> checkDocument(
      String base64, String documentName, String id) async {
    try {
      if (documentName == 'CIN') {
        await _firestoreService.updateStatuCin(true);
        await _firestoreService
            .addMessage('Votre CIN a été vérifiée avec succès');
      }
      if (documentName == 'Carte Grise(recto)') {
        await _firestoreService.updateStatuCarteGriseRecto(id, true);
      }
      if (documentName == 'Carte Grise(verso)') {
        await _firestoreService.updateStatuCarteGriseVerso(id, true);
      }
      if (documentName == 'Permis(recto)') {
        await _firestoreService.updateStatuPermisRecto(id, true);
      }
      if (documentName == 'Permis(verso)') {
        await _firestoreService.updateStatuPermisVerso(id, true);
      }
      return right(true);
    } catch (e) {
      return left(FirebaseAuthFailure(errMessage: "errMessage"));
    }
  }
}
