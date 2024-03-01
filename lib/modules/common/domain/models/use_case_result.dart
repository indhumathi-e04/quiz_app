class UseCaseResult {
  final String? errorMessage;
  final String? errorCode;

  UseCaseResult({
    required this.errorCode,
    required this.errorMessage,
  });

  bool get isSuccess => (errorCode == null && errorMessage == null);
}
