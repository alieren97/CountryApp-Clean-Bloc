import 'package:countries/injection_container.dart';
import 'package:countries/presentation/bottom_bar/bottom_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:countries/presentation/countries/blocs/blocs.dart';

Future<void> main() async {
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
        BlocProvider<FilterCountryBloc>(create: (context) => FilterCountryBloc()),
        BlocProvider<FilteredCountriesBloc>(
            create: (context) => FilteredCountriesBloc(
                initialCountries:
                    context.read<FetchCountriesBloc>().state.countries))
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
