// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'country_detail_bloc.dart';

sealed class CountryDetailEvent extends Equatable {
  const CountryDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchCountriyDetail extends CountryDetailEvent {
  final String countryName;
  const FetchCountriyDetail({
    required this.countryName,
  });

  @override
  String toString() => 'FetchCountrieyDetail(countryName: $countryName)';

  @override
  List<Object> get props => [countryName];
}
