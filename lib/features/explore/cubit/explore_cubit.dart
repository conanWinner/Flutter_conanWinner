import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/data/models/Grocery.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreState(loading: false, categories: []));

  void fetchCategories() async {
    try {
      // Giả lập lấy data

      List<Grocery> categories = [
        Grocery(
          image: "assets/images/vegetable.png",
          cardName: "Frash Fruits & Vegetable",
          id: '1',
        ),
        Grocery(
          image: "assets/images/vegetable.png",
          cardName: "Frash Fruits & Vegetable",
          id: '2',
        ),
        Grocery(
          image: "assets/images/vegetable.png",
          cardName: "Frash Fruits & Vegetable",
          id: '3',
        ),
        Grocery(
          image: "assets/images/vegetable.png",
          cardName: "Frash Fruits & Vegetable",
          id: '4',
        ),
        Grocery(
          image: "assets/images/vegetable.png",
          cardName: "Frash Fruits & Vegetable",
          id: '5',
        ),
        Grocery(
          image: "assets/images/vegetable.png",
          cardName: "Frash Fruits & Vegetable",
          id: '6',
        ),
      ];

      emit(ExploreState(loading: true, categories: categories));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(loading: false));
    } catch (e) {}
  }

  void isLoading() async {
    try {
      emit(state.copyWith(loading: true));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(loading: false));
    } catch (e) {}
  }
}
