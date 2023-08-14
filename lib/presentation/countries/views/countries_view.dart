import 'package:countries/presentation/countries/bloc/country_bloc_imports.dart';
import 'package:countries/presentation/countries/widgets/country_filter_view.dart';
import 'package:countries/presentation/countries/widgets/country_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [const CountryFilterView(), Expanded(child: _buildBody())],
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<CountryBloc, CountryState>(
      builder: (context, state) {
        if (state is CountryLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is CountryException) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is CountryDone) {
          return ListView.builder(
              itemCount: state.countries!.length,
              itemBuilder: (context, index) {
                var country = state.countries![index];
                return CountryTile(country: country);
              });
        }
        return const SizedBox();
      },
    );
  }
}
