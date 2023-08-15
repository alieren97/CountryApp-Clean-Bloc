import 'package:bloc/bloc.dart';
import 'package:countries/domain/entities/country.dart';
import 'package:equatable/equatable.dart';

part 'filtered_countries_event.dart';
part 'filtered_countries_state.dart';

class FilteredCountriesBloc
    extends Bloc<FilteredCountriesEvent, FilteredCountriesState> {
  final List<Country> initialCountries;
  FilteredCountriesBloc({required this.initialCountries})
      : super(FilteredCountriesState(filteredCountries: initialCountries)) {
    on<CalculateFilteredCountriesEvent>((event, emit) {
      emit(state.copyWith(filteredCountries: event.filteredCountries));
    });
  }
}
