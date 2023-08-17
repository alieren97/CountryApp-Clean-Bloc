import 'package:bloc/bloc.dart';
import 'package:countries/app/resources/data_state.dart';
import 'package:countries/domain/entities/country.dart';
import 'package:countries/domain/usecases/get_country_detail_usecase.dart';
import 'package:equatable/equatable.dart';

part 'country_detail_event.dart';
part 'country_detail_state.dart';

class CountryDetailBloc extends Bloc<CountryDetailEvent, CountryDetailState> {
  final GetCountryDetailUseCase _getCountryDetailUseCase;
  CountryDetailBloc(this._getCountryDetailUseCase)
      : super(CountryDetailState.initial()) {
    on<FetchCountriyDetail>(_fetchCountryDetail);
  }

  Future<void> _fetchCountryDetail(
      FetchCountriyDetail event, Emitter<CountryDetailState> emit) async {
    emit(state.copyWith(status: CountryDetailStatus.loading));

    try {
      final dataState = await _getCountryDetailUseCase(params: event.countryName);

      if (dataState is DataSuccess) {
        emit(state.copyWith(
            status: CountryDetailStatus.loaded, country: dataState.data!.first));
      }

      if (dataState is DataFailure) {
        emit(state.copyWith(
            status: CountryDetailStatus.error,
            error: dataState.exception!.message));
      }
    } catch (e) {
      emit(state.copyWith(
          status: CountryDetailStatus.error, error: e.toString()));
    }
  }
}
