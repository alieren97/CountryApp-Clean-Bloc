part of 'fetch_countries_bloc.dart';

sealed class FetchCountriesEvent extends Equatable {
  const FetchCountriesEvent();

  @override
  List<Object> get props => [];
}

class FetchCountries extends FetchCountriesEvent {
  
}