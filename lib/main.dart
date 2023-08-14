import 'package:countries/injection_container.dart';
import 'package:countries/presentation/bottom_bar/bottom_bar_view.dart';
import 'package:countries/presentation/countries/bloc/country_bloc_imports.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await initializeDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryBloc>(
      create: (context) => sl()..add(const GetCountries()),
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
