import 'package:countries/domain/entities/country.dart';
import 'package:countries/presentation/countries/blocs/blocs.dart';
import 'package:countries/presentation/country_detail/views/country_detail_view.dart';
import 'package:flutter/material.dart';

class CountryTile extends StatelessWidget {
  final Country country;
  const CountryTile({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        country.name!.official!,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(country.region!),
      leading: Text(country.flag!, style: const TextStyle(fontSize: 26)),
      trailing: const Icon(Icons.favorite_border),
      onTap: () {
        context
            .read<SelectedCountryBloc>()
            .add(SelectCountryEvent(country: country));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CountryDetailView()),
        );
      },
    );
  }
}
