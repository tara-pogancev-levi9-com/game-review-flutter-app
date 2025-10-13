class AppException implements Exception {
  final String messageKey;
  final String? fallbackMessage;
  final dynamic originalError;

  AppException(
    this.messageKey, {
    this.fallbackMessage,
    this.originalError,
  });

  @override
  String toString() => fallbackMessage ?? messageKey;
}
