import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/data/models/Product.dart';

part 'food_type_state.dart';

class FoodTypeCubit extends Cubit<FoodTypeState> {
  FoodTypeCubit() : super(FoodTypeState(isShow: false, nameCard: '', id_grocery: '1'));

  void isShow() {
    emit(state.copyWith(isShow: true));
  }

  void changNameCard(String name) {
    emit(state.copyWith(nameCard: name));
  }

  void changIdGrocery(String id_grocery) {
    emit(state.copyWith(id_grocery: id_grocery));
  }

}
