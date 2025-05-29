part of 'home_cubit.dart';

abstract class HomeState{}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> card;
  final List<Product> subCard;

  HomeLoaded({required this.card, required this.subCard});

}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}


