import 'package:countries/app/resources/data_state.dart';
import 'package:countries/domain/entities/country.dart';

abstract class CountryRepository {
  Future<DataState<List<Country>>> getCountries();
}
