import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/core/constants/api_constants.dart';
import 'package:flutter_w1/features/login/data/login_request.dart';
import 'package:flutter_w1/features/login/data/login_response.dart';
import 'package:flutter_w1/storage/storage_token.dart';
import 'package:flutter_w1/storage/storage_user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
    : super(
        LoginState(
          emailError: "",
          passwordError: "",
          loading: false,
          disableButton: false,
          alert: 0,
        ),
      );

  final Dio dio = Dio();

  bool tmpEmail = false;
  bool tmpPassword = false;

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
          disableButton: (tmpEmail && tmpPassword) ? false : true,
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
          disableButton: (tmpEmail && tmpPassword) ? false : true,
        ),
      );
    }
  }

  // Login api

  Future<void> login(String email, String password) async {
    emit(state.copyWith(loading: true));

    try {
      final response = await dio.post(
        LOGIN_POST,
        data: LoginRequest(email: email, password: password).toJson(),
      );

      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);

        await StorageToken.saveToken(loginResponse.accessToken);
        emit(
          state.copyWith(
            isLoginSuccess: true,
            loading: false,
            alert: state.alert,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoginSuccess: false,
            loading: false,
            alert: state.alert + 1,
          ),
        );
      }
    } catch (e) {
      print(e);
      emit(
        state.copyWith(
          isLoginSuccess: false,
          loading: false,
          alert: state.alert + 1,
        ),
      );
    }
  }

  // Logout
  Future<void> logout() async {
    if (await StorageToken.removeToken() && await StorageUser.clearUserInfo()) {
      emit(state.copyWith(isLoginSuccess: false));
    }
  }
}

// {
// "email": "nguyenson@yopmail.com",
// "password": "Admin@123"
// }
