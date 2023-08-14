import 'package:countries/presentation/countries/views/countries_view.dart';
import 'package:countries/presentation/country_detail/views/country_detail_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String countriesRoute = "/countries";
  static const String countriesDetailRoute = "/countryDetail";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.countriesRoute:
        return MaterialPageRoute(builder: (_) => const CountriesView());
      case Routes.countriesDetailRoute:
        return MaterialPageRoute(builder: (_) => CountryDetailView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const  Text("Page not found"),
              ),
              body: const Center(child: Text("Page not found")),
            ));
  }
}
