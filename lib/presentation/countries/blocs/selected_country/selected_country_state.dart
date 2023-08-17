// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_country_bloc.dart';

class SelectedCountryState extends Equatable {
  final Country country;
  SelectedCountryState({
    required this.country,
  });

  factory SelectedCountryState.initial() {
    return SelectedCountryState(country: Country());
  }

  @override
  List<Object> get props => [country];

  SelectedCountryState copyWith({
    Country? country,
  }) {
    return SelectedCountryState(
      country: country ?? this.country,
    );
  }
}
