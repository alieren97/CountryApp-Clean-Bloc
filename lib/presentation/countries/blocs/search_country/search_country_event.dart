part of 'search_country_bloc.dart';

sealed class SearchCountryEvent extends Equatable {
  const SearchCountryEvent();

  @override
  List<Object> get props => [];
}

class SetSearchTermEvent extends SearchCountryEvent {
  final String newSearchItem;
  const SetSearchTermEvent({
    required this.newSearchItem,
  });

  @override
  String toString() => 'SetSearchTermEvent(newSearchItem: $newSearchItem)';

  @override
  List<Object> get props => [newSearchItem];
}
