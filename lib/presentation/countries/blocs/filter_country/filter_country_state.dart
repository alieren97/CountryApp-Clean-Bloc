part of 'filter_country_bloc.dart';

enum Filter {
  all, europe, asia, americas, africa, oceania, antarctic
}

class FilterCountryState extends Equatable {
  final Filter filter;
  const FilterCountryState({
    required this.filter,
  });
  factory FilterCountryState.initial() {
    return const FilterCountryState(filter: Filter.all);
  }
  @override
  List<Object> get props => [filter];

  FilterCountryState copyWith({
    Filter? filter,
  }) {
    return FilterCountryState(
      filter: filter ?? this.filter,
    );
  }
}
