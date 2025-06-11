import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/data/models/Grocery.dart';
import 'package:flutter_w1/data/models/Product.dart';
import 'package:pair/pair.dart';

part 'selected_items_state.dart';

class SelectedItemsCubit extends Cubit<SelectedItemsState> {
  SelectedItemsCubit()
    : super(SelectedItemsState(selectedItems: {}, productQuantities: {}));

  void addItems(Product item) {
    state.selectedItems.putIfAbsent(item.id_grocery, () => Set()).add(item);
    state.productQuantities[item.id] = 1;
    emit(
      state.copyWith(
        selectedItems: state.selectedItems,
        productQuantities: state.productQuantities,
      ),
    );
  }

  // increment quantity
  void incrementQuantity(String id) {
    final currentQuantity = state.productQuantities[id] ?? 1;
    final updatedQuantities = Map<String, int>.from(state.productQuantities);
    updatedQuantities[id] = currentQuantity + 1;

    emit(state.copyWith(productQuantities: updatedQuantities));
  }

  // decrement quantity
  void decrementQuantity(String id) {
    final currentQuantity = state.productQuantities[id] ?? 1;
    if (currentQuantity > 1) {
      final updatedQuantities = Map<String, int>.from(state.productQuantities);
      updatedQuantities[id] = currentQuantity - 1;

      emit(state.copyWith(productQuantities: updatedQuantities));
    }
  }

  // Helper method để lấy quantity theo id
  int getQuantityById(String id) {
    return state.productQuantities[id] ?? 1;
  }
}
