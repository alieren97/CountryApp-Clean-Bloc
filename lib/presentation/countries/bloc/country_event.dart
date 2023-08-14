part of 'country_bloc.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

class GetCountries extends CountryEvent {
  const GetCountries();
}

class GetSortedCountries extends CountryEvent {
  final String? continent;
  const GetSortedCountries({this.continent});

  @override
  List<Object> get props => [continent!];
}

class GetSearchedCountries extends CountryEvent {
  final String? text;
  const GetSearchedCountries({this.text});

  @override
  List<Object> get props => [text!];
}
