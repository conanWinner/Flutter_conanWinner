import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/core/constants/api_constants.dart';
import 'package:flutter_w1/core/widgets/alert.dart';
import 'package:flutter_w1/data/models/User.dart';
import 'package:flutter_w1/storage/storage_token.dart';
import 'package:flutter_w1/storage/storage_user.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountState(user: User(), alert: 1));

  final Dio dio = Dio();

  // get data from api
  Future<void> getAccount() async {
    try {
      final token = await StorageToken.getToken();
      if (token != null) {
        final response = await dio.get(
          ACCOUNT_GET,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );

        if (response.statusCode == 200) {
          // Save inforUser => Storage
          User userResponse = User.fromJson(response.data['data']['userInfo']);
          await StorageUser.saveUser(userResponse);
        }
      }
    } catch (e) {}
  }

  // get data from storage
  void fetchAccount() async {
    try {
      User? retrievedUser = await StorageUser.getUser();

      if (retrievedUser != null) {
        emit(state.copyWith(user: retrievedUser));
      }
    } catch (e) {}
  }

  Future<bool?> deleteAccount() async {
    try {
      final token = await StorageToken.getToken();
      if (token != null) {
        final response = await dio.delete(
          ACCOUNT_DELETE,
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );

        if (response.statusCode == 200) {
          print("Successfully deleted");
          print(state.alert);
          emit(state.copyWith(alert: state.alert + 1));
          return true;
        } else {
          print("Unsuccessfully deleted");
          emit(state.copyWith(alert: state.alert));
          return false;
        }
      }
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }


}
