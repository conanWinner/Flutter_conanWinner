import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/data/models/User.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(AccountState(user: User()));

  void fetchAccount() async {
    try {
      final account = User(
        id: "1",
        avatar: "assets/images/avt.png",
        name: "conanWinner",
        email: "conanWinner@gmail.com",
      );

      emit(AccountState(user: account));
    } catch (e) {}
  }
}
