part of 'signup_cubit.dart';

class SignupState {
  final String emailError;
  final String passwordError;
  final String usernameError;
  final bool loading;
  final bool isSignupSuccess;
  final bool disableButton;
  final int alert;

  SignupState({
    required this.emailError,
    required this.passwordError,
    required this.usernameError,
    required this.loading,
    this.isSignupSuccess = false,
    this.disableButton = true,
    this.alert = 0,
  });

  SignupState copyWith({
    String? emailError,
    String? passwordError,
    String? usernameError,
    bool? loading,
    bool? isSignupSuccess,
    bool? disableButton,
    int? alert,
  }) {
    return SignupState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      usernameError: usernameError ?? this.usernameError,
      loading: loading ?? this.loading,
      isSignupSuccess: isSignupSuccess ?? this.isSignupSuccess,
      disableButton: disableButton ?? this.disableButton,
      alert: alert ?? this.alert,
    );
  }
}
