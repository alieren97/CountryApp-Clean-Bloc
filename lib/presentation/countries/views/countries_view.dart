import 'package:countries/domain/entities/country.dart';
import 'package:countries/presentation/countries/widgets/country_filter_view.dart';
import 'package:countries/presentation/countries/widgets/country_tile.dart';
import 'package:flutter/material.dart';
import 'package:countries/presentation/countries/blocs/blocs.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Country> countries =
        context.watch<FilteredCountriesBloc>().state.filteredCountries;

    List<Country> filterListRegion(List<Country> countries, Filter filter) {
      return countries
          .where((Country country) =>
              country.region!.toLowerCase().contains(filter.name.toLowerCase()))
          .toList();
    }

    List<Country> setFilteredCountries(
        Filter filter, List<Country> countries, String searchTerm) {
      List<Country> filteredCountries = [];
      switch (filter) {
        case Filter.all:
          filteredCountries = countries;
        case Filter.africa:
          filteredCountries = filterListRegion(countries, filter);
        case Filter.americas:
          filteredCountries = filterListRegion(countries, filter);
        case Filter.asia:
          filteredCountries = filterListRegion(countries, filter);
        case Filter.europe:
          filteredCountries = filterListRegion(countries, filter);
        case Filter.oceania:
          filteredCountries = filterListRegion(countries, filter);
        case Filter.antarctic:
          filteredCountries = filterListRegion(countries, filter);
        default:
      }

      if (searchTerm.isNotEmpty) {
        filteredCountries = countries
            .where((Country country) => country.name!.official!
                .toLowerCase()
                .contains(searchTerm.toLowerCase()))
            .toList();
      }
      return filteredCountries;
    }

    return Scaffold(
      body: Column(
        children: [
          const CountryFilterView(),
          Expanded(
            child: MultiBlocListener(
                listeners: [
                  BlocListener<FetchCountriesBloc, FetchCountriesState>(
                    listener: (context, state) {
                      final filteredCountries = setFilteredCountries(
                          context.read<FilterCountryBloc>().state.filter,
                          state.countries,
                          context.read<SearchCountryBloc>().state.searchTerm);
                      context.read<FilteredCountriesBloc>().add(
                          CalculateFilteredCountriesEvent(
                              filteredCountries: filteredCountries));
                    },
                  ),
                  BlocListener<FilterCountryBloc, FilterCountryState>(
                    listener: (context, state) {
                      final filteredCountries = setFilteredCountries(
                          state.filter,
                          context.read<FetchCountriesBloc>().state.countries,
                          context.read<SearchCountryBloc>().state.searchTerm);
                      context.read<FilteredCountriesBloc>().add(
                          CalculateFilteredCountriesEvent(
                              filteredCountries: filteredCountries));
                    },
                  ),
                  BlocListener<SearchCountryBloc, SearchCountryState>(
                    listener: (context, state) {
                      final filteredCountries = setFilteredCountries(
                          context.read<FilterCountryBloc>().state.filter,
                          context.read<FetchCountriesBloc>().state.countries,
                          state.searchTerm);
                      context.read<FilteredCountriesBloc>().add(
                          CalculateFilteredCountriesEvent(
                              filteredCountries: filteredCountries));
                    },
                  )
                ],
                child: ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      var country = countries[index];
                      return CountryTile(country: country);
                    })),
          )
        ],
      ),
    );
  }
}
