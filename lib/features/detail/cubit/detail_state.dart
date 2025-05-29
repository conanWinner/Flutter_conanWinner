part of 'detail_cubit.dart';

class DetailState {
  final Product product;
  final bool isHearted;

  DetailState({required this.product, this.isHearted = true});

  DetailState copyWith({Product? product, bool? isHearted}) {
    return DetailState(
      product: product ?? this.product,
      isHearted: isHearted ?? this.isHearted,
    );
  }
}
