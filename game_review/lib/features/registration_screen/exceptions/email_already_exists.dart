class EmailAlreadyExistsException implements Exception {
  final String message;
  EmailAlreadyExistsException(this.message);
}
