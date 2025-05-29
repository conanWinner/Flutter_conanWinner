part of 'explore_cubit.dart';

class ExploreState {
  final bool loading;
  final List<Grocery> categories;

  ExploreState({
    required this.loading,
    required this.categories,
  });

  ExploreState copyWith({
    bool? loading,
  }) {
    return ExploreState(
      loading: loading ?? this.loading,
      categories: categories,
    );
  }
}
