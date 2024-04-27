import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class CheckDataRepo {
  Future<Either<Unit, XFile>> getImage(ImageSource source);
}
