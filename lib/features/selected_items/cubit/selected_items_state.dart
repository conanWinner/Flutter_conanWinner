part of 'selected_items_cubit.dart';

class SelectedItemsState {
  final Map<String, Set<Product>> selectedItems;
  final Map<String, int> productQuantities;

  SelectedItemsState({
    required this.selectedItems,
    required this.productQuantities,
  });

  SelectedItemsState copyWith({
    Map<String, Set<Product>>? selectedItems,
    Map<String, int>? productQuantities,
  }) {
    return SelectedItemsState(
      selectedItems: selectedItems ?? this.selectedItems,
      productQuantities: productQuantities ?? this.productQuantities,
    );
  }

  // Helper method để lấy quantity theo id
  int getQuantityById(String id) {
    return productQuantities[id] ?? 1;
  }
}