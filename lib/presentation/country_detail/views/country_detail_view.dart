import 'package:countries/presentation/countries/blocs/blocs.dart';
import 'package:countries/presentation/country_detail/blocs/bloc/country_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryDetailView extends StatefulWidget {
  const CountryDetailView({super.key});

  @override
  State<CountryDetailView> createState() => _CountryDetailViewState();
}

class _CountryDetailViewState extends State<CountryDetailView> {
  @override
  void initState() {
    super.initState();
    context.read<CountryDetailBloc>().add(FetchCountriyDetail(
        countryName:
            context.read<SelectedCountryBloc>().country!.name!.common!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<CountryDetailBloc, CountryDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == CountryDetailStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == CountryDetailStatus.loaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  child: Image.network(
                    state.country.flags?.png ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.country.name?.official ?? "",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        state.country.name?.common ?? "",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        state.country.region ?? "",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        state.country.subRegion ?? "",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
