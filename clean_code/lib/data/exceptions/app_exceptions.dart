class AppExceptions implements Exception {
  final _message;
  final _prefix;

  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    // TODO: implement toString
    return "$_message$_prefix";
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message])
      : super(message, "No Internet Connection");
}
