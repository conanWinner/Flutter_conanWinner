part of 'login_cubit.dart';

class LoginState {
  final String emailError;
  final String passwordError;
  final bool loading;
  final bool isLoginSuccess;
  final bool disableButton;
  final int alert;

  LoginState({
    required this.emailError,
    required this.passwordError,
    required this.loading,
    this.isLoginSuccess = false,
    this.disableButton = true,
    this.alert = 0,

  });

  LoginState copyWith({
    String? emailError,
    String? passwordError,
    bool? loading,
    bool? isLoginSuccess,
    bool? disableButton,
    int? alert,

  }) {
    return LoginState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      loading: loading ?? this.loading,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
      disableButton: disableButton ?? this.disableButton,
      alert: alert ?? this.alert,
    );
  }
}
