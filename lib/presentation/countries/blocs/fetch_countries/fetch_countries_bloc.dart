import 'package:bloc/bloc.dart';
import 'package:countries/app/resources/data_state.dart';
import 'package:countries/domain/entities/country.dart';
import 'package:countries/domain/usecases/get_countries_usecase.dart';
import 'package:equatable/equatable.dart';

part 'fetch_countries_event.dart';
part 'fetch_countries_state.dart';

class FetchCountriesBloc
    extends Bloc<FetchCountriesEvent, FetchCountriesState> {
  final GetCountriesUseCase _getCountriesUseCase;

  FetchCountriesBloc(this._getCountriesUseCase)
      : super(FetchCountriesState.initial()) {
    on<FetchCountries>(_fetchCountries);
  }

  Future<void> _fetchCountries(
      FetchCountries event, Emitter<FetchCountriesState> emit) async {
    emit(state.copyWith(status: FetchCountriesStatus.loading));
    
    try {
      final dataState = await _getCountriesUseCase();
      
      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        emit(state.copyWith(
            status: FetchCountriesStatus.loaded, countries: dataState.data));
      }

      if (dataState is DataFailure) {
        emit(state.copyWith(
            status: FetchCountriesStatus.error,
            error: dataState.exception!.message));
      }
    } catch (e) {
      emit(state.copyWith(
          status: FetchCountriesStatus.error, error: e.toString()));
    }
  }
}
