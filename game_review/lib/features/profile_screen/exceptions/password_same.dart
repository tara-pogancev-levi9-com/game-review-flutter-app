class PasswordSameAsOldException implements Exception {
  final String message;
  PasswordSameAsOldException(this.message);
}
