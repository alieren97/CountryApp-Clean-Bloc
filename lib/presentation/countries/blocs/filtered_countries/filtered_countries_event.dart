part of 'filtered_countries_bloc.dart';

sealed class FilteredCountriesEvent extends Equatable {
  const FilteredCountriesEvent();

  @override
  List<Object> get props => [];
}

class CalculateFilteredCountriesEvent extends FilteredCountriesEvent {
  final List<Country> filteredCountries;
  const CalculateFilteredCountriesEvent({
    required this.filteredCountries,
  });

  @override
  String toString() =>
      'CalculateFilteredTodosEvent(filteredTodos: $filteredCountries)';
  @override
  List<Object> get props => [filteredCountries];
}
