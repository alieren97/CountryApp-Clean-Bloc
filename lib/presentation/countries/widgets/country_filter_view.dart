import 'package:countries/presentation/countries/bloc/country_bloc_imports.dart';
import 'package:countries/presentation/countries/widgets/country_search_field.dart';
import 'package:flutter/material.dart';

class CountryFilterView extends StatefulWidget {
  const CountryFilterView({super.key});

  @override
  State<CountryFilterView> createState() => _CountryFilterViewState();
}

class _CountryFilterViewState extends State<CountryFilterView> {
  final List<String> _items = [
    'All',
    'Europe',
    'Asia',
    'Americas',
    'Africa',
    'Oceania',
    'Antarctic'
  ];
  String? selectedItem = "All";
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 110,
        child: Column(
          children: [
            const CountrySearchField(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedItem!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.menu),
                  itemBuilder: (context) {
                    return _items.map((item) {
                      return PopupMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList();
                  },
                  onSelected: (item) {
                    context
                        .read<CountryBloc>()
                        .add(GetSortedCountries(continent: item));
                    setState(() {
                      selectedItem = item;
                    });
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
