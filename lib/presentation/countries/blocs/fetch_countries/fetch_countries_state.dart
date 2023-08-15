// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fetch_countries_bloc.dart';

enum FetchCountriesStatus { initial, loading, loaded, error }

class FetchCountriesState extends Equatable {
  final FetchCountriesStatus status;
  final List<Country> countries;
  final String error;

  const FetchCountriesState({
    required this.status,
    required this.countries,
    required this.error,
  });

  factory FetchCountriesState.initial() {
    return const FetchCountriesState(
        status: FetchCountriesStatus.initial, countries: [], error: "");
  }

  @override
  List<Object?> get props => [status, countries, error];

  FetchCountriesState copyWith({
    FetchCountriesStatus? status,
    List<Country>? countries,
    String? error,
  }) {
    return FetchCountriesState(
      status: status ?? this.status,
      countries: countries ?? this.countries,
      error: error ?? this.error,
    );
  }
}
