abstract class Failure {

  final String errMessage;

  Failure({
    required this.errMessage,
  });

}

class SignUpFailure extends Failure
{
  SignUpFailure({required super.errMessage});

}