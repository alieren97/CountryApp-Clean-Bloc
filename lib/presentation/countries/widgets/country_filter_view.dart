import 'package:countries/presentation/countries/widgets/country_search_field.dart';
import 'package:flutter/material.dart';
import 'package:countries/presentation/countries/blocs/blocs.dart';

class CountryFilterView extends StatefulWidget {
  const CountryFilterView({super.key});

  @override
  State<CountryFilterView> createState() => _CountryFilterViewState();
}

class _CountryFilterViewState extends State<CountryFilterView> {
  String selectedItem = "ALL";
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
                    return Filter.values.map((item) {
                      return PopupMenuItem(
                        value: item,
                        child: Text(item.name.toUpperCase()),
                      );
                    }).toList();
                  },
                  onSelected: (item) {
                    context
                        .read<FilterCountryBloc>()
                        .add(ChangeFilterEvent(newFilter: item));
                    setState(() {
                      selectedItem = item.name.toUpperCase();
                    });
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
