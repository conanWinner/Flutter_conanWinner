import 'package:flutter_bloc/flutter_bloc.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit()
    : super(
        SignupState(
          emailError: "",
          passwordError: "",
          usernameError: "",
          loading: false,
          disableButton: false,
        ),
      );

  bool tmpEmail = false;
  bool tmpPassword = false;
  bool tmpUsername = false;

  bool validateEmail(String email) {
    if (!email.contains("@")) return false;
    var tmp = email.split("@");
    if (tmp[0].length < 2) return false;
    return true;
  }

  void onchangeEmail(String email) {
    if (!validateEmail(email)) {
      tmpEmail = false;
      emit(
        state.copyWith(
          emailError: "Please enter a valid email format!",
          disableButton: true,
        ),
      );
    } else {
      tmpEmail = true;
      emit(
        state.copyWith(
          emailError: '',
          disableButton: (tmpEmail && tmpPassword && tmpUsername) ? false : true,
        ),
      );
    }
  }

  void disableButton() {
    emit(state.copyWith(disableButton: true));
  }

  bool validatePassword(String password) {
    int up = 0;
    int low = 0;
    int num = 0;
    if (password.length < 6) return false;
    var value = password.codeUnits;
    for (int i = 0; i < value.length; i++) {
      if (value[i] >= 'A'.codeUnits.first && value[i] <= 'Z'.codeUnits.first)
        up++;
      if (value[i] >= 'a'.codeUnits.first && value[i] <= 'z'.codeUnits.first)
        low++;
      if (value[i] >= '0'.codeUnits.first && value[i] <= '9'.codeUnits.first)
        num++;
    }

    if (up == 0 || low == 0 || num == 0) return false;

    return true;
  }

  void onchangePassword(String password) {
    if (!validatePassword(password)) {
      tmpPassword = false;
      emit(
        state.copyWith(
          passwordError:
              "Password must be at least 6 characters with 1 uppercase letter, 1 lowercase letter, and 1 number.",
          disableButton: true,
        ),
      );
    } else {
      tmpPassword = true;
      emit(
        state.copyWith(
          passwordError: '',
          disableButton:
              (tmpEmail && tmpPassword && tmpUsername) ? false : true,
        ),
      );
    }
  }

  bool validateUsername(String username) {
    return username.length < 6 ? false : true;
  }

  void onchangeUsername(String username) {
    if (!validateUsername(username)) {
      tmpUsername = false;
      emit(
        state.copyWith(
          usernameError: "Username must be at least 6 characters",
          disableButton: true,
        ),
      );
    } else {
      tmpUsername = true;
      emit(
        state.copyWith(
          usernameError: '',
          disableButton:
              (tmpEmail && tmpPassword && tmpUsername) ? false : true,
        ),
      );
    }
  }

  void login(String email, String password) async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(seconds: 2));

    if (email == "admin@gmail.com" && password == "Thang2506@@") {
      emit(state.copyWith(isLoginSuccess: true, loading: false));
    } else {
      emit(state.copyWith(isLoginSuccess: false, loading: false));
    }
  }

  void logout() {
    emit(state.copyWith(isLoginSuccess: false));
  }
}
