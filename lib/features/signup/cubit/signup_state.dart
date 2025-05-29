part of 'signup_cubit.dart';

class SignupState {
  final String emailError;
  final String passwordError;
  final String usernameError;
  final bool loading;
  final bool isLoginSuccess;
  final bool disableButton;

  SignupState({
    required this.emailError,
    required this.passwordError,
    required this.usernameError,
    required this.loading,
    this.isLoginSuccess = false,
    this.disableButton = true,
  });

  SignupState copyWith({
    String? emailError,
    String? passwordError,
    String? usernameError,
    bool? loading,
    bool? isLoginSuccess,
    bool? disableButton,
  }) {
    return SignupState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      usernameError: usernameError ?? this.usernameError,
      loading: loading ?? this.loading,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
      disableButton: disableButton ?? this.disableButton,
    );
  }
}
