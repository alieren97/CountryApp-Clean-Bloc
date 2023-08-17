import 'package:countries/injection_container.dart';
import 'package:countries/presentation/bottom_bar/bottom_bar_view.dart';
import 'package:countries/presentation/country_detail/blocs/bloc/country_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:countries/presentation/countries/blocs/blocs.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initializeDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FetchCountriesBloc>(
            create: (context) => sl()..add(FetchCountries())),
        BlocProvider<SearchCountryBloc>(create: (context) => sl()),
        BlocProvider<FilterCountryBloc>(
            create: (context) => FilterCountryBloc()),
        BlocProvider<FilteredCountriesBloc>(
            create: (context) => FilteredCountriesBloc(
                initialCountries:
                    context.read<FetchCountriesBloc>().state.countries)),
        BlocProvider<CountryDetailBloc>(
            create: (context) => CountryDetailBloc(sl())),
        BlocProvider<SelectedCountryBloc>(
            create: (context) => SelectedCountryBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BottomBar(),
      ),
    );
  }
}
