part of 'food_type_cubit.dart';

class FoodTypeState {
  final bool isShow;
  String nameCard;
  String id_grocery;

  FoodTypeState({
    required this.isShow,
    this.nameCard = '',
    this.id_grocery = '1',
  });

  FoodTypeState copyWith({bool? isShow, String? nameCard, String? id_grocery}) {
    return FoodTypeState(
      isShow: isShow ?? this.isShow,
      nameCard: nameCard ?? this.nameCard,
      id_grocery: id_grocery ?? this.id_grocery,
    );
  }
}
