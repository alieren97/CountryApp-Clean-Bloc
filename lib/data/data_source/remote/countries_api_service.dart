import 'package:countries/app/config/constants/constants.dart';
import 'package:countries/data/models/country_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'countries_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class CountriesApiService {
  factory CountriesApiService(Dio dio) = _CountriesApiService;

  @GET("/all")
  Future<HttpResponse<List<CountryModel>>> getCountries();

  @GET("/name/{name}?fullText=true")
  Future<HttpResponse<List<CountryModel>>> getCountryDetail(
      @Path("name") String name);
}
