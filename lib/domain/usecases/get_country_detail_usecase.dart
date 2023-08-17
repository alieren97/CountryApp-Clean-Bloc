import 'package:countries/app/resources/base_usecase.dart';
import 'package:countries/app/resources/data_state.dart';
import 'package:countries/domain/entities/country.dart';
import 'package:countries/domain/repository/country_repository.dart';

class GetCountryDetailUseCase implements UseCase<DataState<List<Country>>, String> {
  final CountryRepository _countryRepository;
  GetCountryDetailUseCase(this._countryRepository);

  @override
  Future<DataState<List<Country>>> call({String? params}) {
    return _countryRepository.getCountryDetail(name: params!.toLowerCase());
  }
}
