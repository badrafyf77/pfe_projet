sealed class CheckDocumentEvent {}

class CheckDocument extends CheckDocumentEvent {
  final String documentName;
  final String base64;
  final String id;
  CheckDocument({
    required this.documentName,
    required this.base64,
    required this.id,
  });
}
