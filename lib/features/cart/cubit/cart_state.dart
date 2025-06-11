part of 'cart_cubit.dart';

class CartState {
  final List<Grocery> foodType;

  CartState({required this.foodType});

  CartState copyWith({List<Grocery>? foodType}) {
    return CartState(foodType: foodType ?? this.foodType);
  }
}
