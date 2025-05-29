part of 'account_cubit.dart';

class AccountState {
  final User user;

  AccountState({required this.user});

  AccountState copyWith({required User user}) {
    return AccountState(user: user);
  }
}
