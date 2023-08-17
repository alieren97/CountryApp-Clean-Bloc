import 'dart:io';

import 'package:countries/app/resources/data_state.dart';
import 'package:countries/data/data_source/remote/countries_api_service.dart';
import 'package:countries/data/models/country_model.dart';
import 'package:countries/domain/entities/country.dart';
import 'package:countries/domain/repository/country_repository.dart';
import 'package:dio/dio.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountriesApiService _countriesApiService;
  CountryRepositoryImpl(this._countriesApiService);

  @override
  Future<DataState<List<CountryModel>>> getCountries() async {
    try {
      final httpResponse = await _countriesApiService.getCountries();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<List<Country>>> getCountryDetail({required String name}) async {
    try {
      final httpResponse = await _countriesApiService.getCountryDetail(name);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailure(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }
}
