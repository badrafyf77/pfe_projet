
sealed class CheckDocumentEvent {}

class CheckDocument extends CheckDocumentEvent {
  final String cin;
  final String base64;
  CheckDocument({
    required this.cin,
    required this.base64,
  });
}
