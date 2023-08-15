// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_country_bloc.dart';

class SearchCountryState extends Equatable {
  final String searchTerm;
  const SearchCountryState({
    required this.searchTerm,
  });
  factory SearchCountryState.initial() {
    return const SearchCountryState(searchTerm: '');
  }
  @override
  List<Object> get props => [searchTerm];

  SearchCountryState copyWith({
    String? searchTerm,
  }) {
    return SearchCountryState(
      searchTerm: searchTerm ?? this.searchTerm,
    );
  }
}
