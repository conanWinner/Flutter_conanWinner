part of 'account_cubit.dart';

class AccountState {
  final User user;
  int alert = 1;

  AccountState({required this.user, required this.alert});

  AccountState copyWith({User? user, int? alert}) {
    return AccountState(user: user ?? this.user, alert: alert ?? this.alert);
  }
}
