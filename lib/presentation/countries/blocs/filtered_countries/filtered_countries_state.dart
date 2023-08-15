part of 'filtered_countries_bloc.dart';

class FilteredCountriesState extends Equatable {
  final List<Country> filteredCountries;
  const FilteredCountriesState({
    required this.filteredCountries,
  });

  factory FilteredCountriesState.initial() {
    return FilteredCountriesState(filteredCountries: []);
  }

  @override
  List<Object> get props => [filteredCountries];

  @override
  String toString() => 'FilteredTodosState(filteredTodos: $filteredCountries)';

  FilteredCountriesState copyWith({
    List<Country>? filteredCountries,
  }) {
    return FilteredCountriesState(
      filteredCountries: filteredCountries ?? this.filteredCountries,
    );
  }
}
