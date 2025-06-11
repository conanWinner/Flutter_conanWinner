import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/data/models/Grocery.dart';
import 'package:flutter_w1/data/models/Product.dart';
import 'package:pair/pair.dart';

part 'items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(ItemsState(listItems: []));

  void items() async {
    try {
      List<Product> listItems = [
        Product(
          image: "assets/images/typefood/tp1.png",
          cardName: "Fruits 1.1",
          id: '1',
          id_grocery: '1',
          price: "4.99",
          quantity: 1,
        ),
        Product(
          image: "assets/images/vegetable.png",
          cardName: "Fruits 1.2",
          id: '2',
          id_grocery: '1',
          price: "8.99",
          quantity: 1,
        ),
        Product(
          image: "assets/images/vegetable.png",
          cardName: "Fruits 1.3",
          id: '3',
          id_grocery: '1',
          price: "7.99",
          quantity: 1,
        ),
        Product(
          image: "assets/images/typefood/tp1.png",
          cardName: "Fruits 2.1",
          id: '4',
          id_grocery: '2',
          price: "4.99",
          quantity: 1,
        ),
        Product(
          image: "assets/images/vegetable.png",
          cardName: "Fruits 2.2",
          id: '5',
          id_grocery: '2',
          price: "4.0",
          quantity: 1,
        ),
        Product(
          image: "assets/images/vegetable.png",
          cardName: "Fruits 2.3",
          id: '6',
          id_grocery: '2',
          price: "0.99",
          quantity: 1,
        ),
      ];

      emit(ItemsState(listItems: listItems));
    } catch (e) {}
  }
}
