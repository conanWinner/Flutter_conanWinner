import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/data/models/Product.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void fetchProducts() async {
    emit(HomeLoading());

    try {
      // Giả lập lấy data
      await Future.delayed(Duration(seconds: 2));
      List<Product> card = [
        Product(image: "assets/images/apple.png",cardName: "Naturel Red", weight: "10kg", price: "4.99", id: "1"),
        Product(image: "assets/images/apple.png",cardName: "Naturel", weight: "10kg", price: "1.99", id: "2"),
        Product(image: "assets/images/apple.png",cardName: "Naturel Red", weight: "19kg", price: "4.99", id: "3"),
      ];

      List<Product> subCard = [
        Product(image: "assets/images/apple.png",cardName: "Pulses", id: '1'),
        Product(image: "assets/images/apple.png",cardName: "Naturel", id: '1'),
        Product(image: "assets/images/apple.png",cardName: "Rice", id: '1'),
      ];

      emit(HomeLoaded(card: card, subCard: subCard));
    } catch (e) {
      emit(HomeError("Lỗi khi tải sản phẩm"));
    }
  }
}
