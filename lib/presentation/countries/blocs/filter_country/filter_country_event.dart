part of 'filter_country_bloc.dart';

sealed class FilterCountryEvent extends Equatable {
  const FilterCountryEvent();

  @override
  List<Object> get props => [];
}

class ChangeFilterEvent extends FilterCountryEvent {
  final Filter newFilter;
  ChangeFilterEvent({
    required this.newFilter,
  });

  @override
  String toString() => 'ChangeFilterEvent(newFilter: $newFilter)';

  @override
  List<Object> get props => [newFilter];
}
