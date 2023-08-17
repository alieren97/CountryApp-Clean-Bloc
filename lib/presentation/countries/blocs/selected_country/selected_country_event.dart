// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'selected_country_bloc.dart';

sealed class SelectedCountryEvent extends Equatable {
  const SelectedCountryEvent();

  @override
  List<Object> get props => [];
}

class SelectCountryEvent extends SelectedCountryEvent{
  final Country country;
  SelectCountryEvent({
    required this.country,
  });

  @override
  List<Object> get props => [country];
}
