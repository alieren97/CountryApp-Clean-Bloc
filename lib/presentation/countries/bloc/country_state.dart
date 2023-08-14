part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  final List<Country> ? countries;
  final List<Country> ? sortedCountries;
  final DioException ? exception;
  const CountryState({this.countries,this.sortedCountries ,this.exception});
  
  @override
  List<Object> get props => [countries ?? [], exception ?? [], sortedCountries ?? []];
}


class CountryLoading extends CountryState {
  const CountryLoading();
}

class CountryDone extends CountryState {
  const CountryDone(List<Country> countries) : super(countries: countries);
}

class CountryException extends CountryState {
  const CountryException(DioException exception) : super(exception: exception);
}

class CountrySortState extends CountryState {
  const CountrySortState(List<Country> sortedCountries) : super(sortedCountries: sortedCountries);
}




