import 'package:bloc/bloc.dart';
import 'package:countries/app/resources/data_state.dart';
import 'package:countries/domain/entities/country.dart';
import 'package:countries/domain/usecases/get_countries_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountriesUseCase _getCountriesUseCase;
  CountryBloc(this._getCountriesUseCase) : super(const CountryLoading()) {
    on<GetCountries>(onGetCountries);
    on<GetSortedCountries>(onGetSortedCountries);
    on<GetSearchedCountries>(onGetSearchedCountries);
  }

  void onGetCountries(GetCountries event, Emitter<CountryState> emitter) async {
    final dataState = await _getCountriesUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(CountryDone(dataState.data!));
    }
    if (dataState is DataFailure) {
      emit(CountryException(dataState.exception!));
    }
  }

  void onGetSortedCountries(
      GetSortedCountries event, Emitter<CountryState> emitter) async {
    final dataState = await _getCountriesUseCase();
    var list = dataState.data!;
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(CountryDone(event.continent == "All"
          ? list
          : list
              .where((element) => element.region == event.continent)
              .toList()));
    }
    if (dataState is DataFailure) {
      emit(CountryException(dataState.exception!));
    }
  }

  void onGetSearchedCountries(
      GetSearchedCountries event, Emitter<CountryState> emitter) async {
    final dataState = await _getCountriesUseCase();
    var list = dataState.data!;
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(CountryDone(event.text != "" ? _searchFilter(event.text)! : list));
    }
    if (dataState is DataFailure) {
      emit(CountryException(dataState.exception!));
    }
  }

  List<Country>? _searchFilter(String? text) {
    return state.countries
        ?.where((element) =>
            element.name!.official!.toLowerCase().contains(text!.toLowerCase()))
        .toList();
  }
}
