import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfe_projet/core/utils/failures.dart';
import 'package:pfe_projet/features/checkdata/data/repo/checkdata_repo.dart';

class CheckDataRepoImplement implements CheckDataRepo {
  @override
  Future<Either<Failure, XFile>> getImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final image = await picker.pickImage(source: source);

      if (image != null) {
        return right(image);
      } else {
        return left(
          GetImageFailure(errMessage: 'il y a une erreur, veuillez réessayer'),
        );
      }
    } catch (e) {
      return left(
        GetImageFailure(
            errMessage:
                'erreur lors de l\'obtention de l\'image, veuillez réessayer'),
      );
    }
  }
}
