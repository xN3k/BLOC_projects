import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginAPI>(_onLoginAPI);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginAPI(LoginAPI event, Emitter<LoginState> emit) async {
    emit(
      state.copyWith(loginStatus: LoginStatus.loading, message: "Loading"),
    );
    Map data = {"email": state.email, "password": state.password};

    try {
      final response =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: data);

      final data1 = json.decode(response.body);

      if (response.statusCode == 202) {
        emit(
          state.copyWith(
              loginStatus: LoginStatus.success, message: "Login Successful"),
        );
      } else {
        emit(
          state.copyWith(
              loginStatus: LoginStatus.error, message: data1['error']),
        );
      }
    } catch (error) {
      emit(
        state.copyWith(
            loginStatus: LoginStatus.error, message: error.toString()),
      );
    }
  }
}
