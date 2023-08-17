part of 'country_detail_bloc.dart';

enum CountryDetailStatus { initial, loading, loaded, error }

class CountryDetailState extends Equatable {
  final CountryDetailStatus status;
  final Country country;
  final String error;

  const CountryDetailState({
    required this.status,
    required this.country,
    required this.error,
  });

  factory CountryDetailState.initial() {
    return const CountryDetailState(
        status: CountryDetailStatus.initial, country: Country(), error: "");
  }

  @override
  List<Object?> get props => [status, country, error];

  CountryDetailState copyWith({
    CountryDetailStatus? status,
    Country? country,
    String? error,
  }) {
    return CountryDetailState(
      status: status ?? this.status,
      country: country ?? this.country,
      error: error ?? this.error,
    );
  }
}
