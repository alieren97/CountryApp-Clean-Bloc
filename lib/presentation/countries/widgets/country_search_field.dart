import 'package:countries/presentation/countries/bloc/country_bloc_imports.dart';
import 'package:flutter/material.dart';

class CountrySearchField extends StatefulWidget {
  const CountrySearchField({super.key});

  @override
  State<CountrySearchField> createState() => _CountrySearchFieldState();
}

class _CountrySearchFieldState extends State<CountrySearchField> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      height: 50,
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: "Search Country Name",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          context.read<CountryBloc>().add(GetSearchedCountries(text: value));
        },
      ),
    );
  }
}
