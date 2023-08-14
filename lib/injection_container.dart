import 'package:countries/data/data_source/remote/countries_api_service.dart';
import 'package:countries/data/repository/country_repository_impl.dart';
import 'package:countries/domain/repository/country_repository.dart';
import 'package:countries/domain/usecases/get_countries_usecase.dart';
import 'package:countries/presentation/countries/bloc/country_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependency() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<CountriesApiService>(CountriesApiService(sl()));
  sl.registerSingleton<CountryRepository>(CountryRepositoryImpl(sl()));
  sl.registerSingleton<GetCountriesUseCase>(GetCountriesUseCase(sl()));
  sl.registerFactory<CountryBloc>(() => CountryBloc(sl()));
}