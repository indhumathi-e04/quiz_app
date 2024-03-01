abstract class ResultState {}

class Success extends ResultState {
  final dynamic data;
  Success({
    this.data,
  });
}

class Error extends ResultState {
  Error({
    this.errorMessage,
    this.errorCode,
  });

  String? errorMessage;
  String? errorCode;
}
