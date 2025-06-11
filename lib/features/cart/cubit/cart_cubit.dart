import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/data/models/Grocery.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(foodType: []));

  List<Grocery> foodType = [
    Grocery(
      image: "assets/images/vegetable.png",
      cardName: "Fruits & Vegetable",
      id: '1',
    ),
    Grocery(
      image: "assets/images/vegetable.png",
      cardName: "Fruits & 1",
      id: '2',
    ),
    Grocery(
      image: "assets/images/vegetable.png",
      cardName: "Fruits & 2",
      id: '3',
    ),
    Grocery(
      image: "assets/images/vegetable.png",
      cardName: "Fruits & 3",
      id: '4',
    ),
    Grocery(
      image: "assets/images/vegetable.png",
      cardName: "Fruits & 4",
      id: '5',
    ),
    Grocery(
      image: "assets/images/vegetable.png",
      cardName: "Fruits & 5",
      id: '6',
    ),
  ];

  void listFoodType() async {
    try {
      emit(CartState(foodType: foodType));
    } catch (e) {}
  }
}
