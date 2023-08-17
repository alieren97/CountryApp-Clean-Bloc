import 'package:countries/data/data_source/remote/countries_api_service.dart';
import 'package:countries/data/repository/country_repository_impl.dart';
import 'package:countries/domain/repository/country_repository.dart';
import 'package:countries/domain/usecases/get_countries_usecase.dart';
import 'package:countries/domain/usecases/get_country_detail_usecase.dart';
import 'package:countries/presentation/countries/blocs/fetch_countries/fetch_countries_bloc.dart';
import 'package:countries/presentation/countries/blocs/filtered_countries/filtered_countries_bloc.dart';
import 'package:countries/presentation/countries/blocs/search_country/search_country_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependency() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<CountriesApiService>(CountriesApiService(sl()));
  sl.registerSingleton<CountryRepository>(CountryRepositoryImpl(sl()));
  sl.registerSingleton<GetCountriesUseCase>(GetCountriesUseCase(sl()));
  sl.registerSingleton<GetCountryDetailUseCase>(GetCountryDetailUseCase(sl()));

  sl.registerFactory<FetchCountriesBloc>(() => FetchCountriesBloc(sl()));
  sl.registerFactory<SearchCountryBloc>(() => SearchCountryBloc());
  //sl.registerFactory<FilteredCountriesBloc>(() => FilteredCountriesBloc(initialCountries: initialCountries));
}