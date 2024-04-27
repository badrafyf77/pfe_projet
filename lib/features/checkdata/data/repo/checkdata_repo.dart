import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pfe_projet/core/utils/failures.dart';

abstract class CheckDataRepo {
  Future<Either<Unit, XFile>> getImage(ImageSource source);

  Future<Either<Failure, Unit>> checkCin();
}
