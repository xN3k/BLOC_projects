part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus loginStatus;
  final String message;

  const LoginState({
    this.email = "",
    this.password = "",
    this.message = "",
    this.loginStatus = LoginStatus.initial,
  });

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? loginStatus,
    String? message,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      loginStatus: loginStatus ?? this.loginStatus,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, message, loginStatus];
}
