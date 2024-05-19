import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/checkdata/data/repo/checkdata_repo.dart';
import 'package:pfe_projet/features/checkdata/data/service/docscan_api_service.dart';

class CheckDataRepoImplement implements CheckDataRepo {
  final DocscanService _docscanService;

  CheckDataRepoImplement(
    this._docscanService,
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
      var result = _docscanService.getCin(base64);
      print(result);
      return right(true);
    } catch (e) {
      return left(FirebaseAuthFailure(errMessage: "errMessage"));
    }
  }
}
