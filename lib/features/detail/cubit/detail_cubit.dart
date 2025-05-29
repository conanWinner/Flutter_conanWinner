import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/data/models/Product.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(Product product) : super(DetailState(product: product));

  // check heart
  void toggleHeart() {
    emit(state.copyWith(isHearted: !state.isHearted));
  }

  // increment quantity
  void incrementQuantity() {
    final currentQuantity = state.product.quantity;
    if (currentQuantity < 5) {
      final updatedProduct = state.product.copyWith(
        quantity: currentQuantity + 1,
      );
      emit(state.copyWith(product: updatedProduct));
    }
  }

  // decrement quantity
  void decrementQuantity() {
    final currentQuantity = state.product.quantity;
    if (currentQuantity > 1) {
      final updatedProduct = state.product.copyWith(
        quantity: currentQuantity - 1,
      );

      emit(state.copyWith(product: updatedProduct));
    }
  }

}
