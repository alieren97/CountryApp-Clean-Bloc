import 'package:countries/app/resources/base_usecase.dart';
import 'package:countries/app/resources/data_state.dart';
import 'package:countries/domain/entities/country.dart';
import 'package:countries/domain/repository/country_repository.dart';

class GetCountriesUseCase implements UseCase<DataState<List<Country>>, void> {
  final CountryRepository _countryRepository;
  GetCountriesUseCase(this._countryRepository);

  @override
  Future<DataState<List<Country>>> call({void params}) {
    return _countryRepository.getCountries();
  }

}