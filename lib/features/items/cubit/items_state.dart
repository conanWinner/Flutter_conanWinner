part of 'items_cubit.dart';

class ItemsState {
  final List<Product> listItems;

  ItemsState({required this.listItems});

  ItemsState copyWith({List<Product>? listItems}) {
    return ItemsState(listItems: listItems ?? this.listItems);
  }
}
