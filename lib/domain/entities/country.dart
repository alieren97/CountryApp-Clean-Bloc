import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final CountryName? name;
  final List<String>? capital;
  final String? region;
  final String? subRegion;
  final String? flag;
  final CountryFlags? flags;
  const Country(
      {this.name, this.capital, this.region, this.subRegion, this.flag, this.flags});

  @override
  List<Object?> get props => [name, capital, region, flag, subRegion, flags];
}

class CountryFlags extends Equatable {
  final String? png;
  final String? svg;
  final String? alt;

  CountryFlags({this.png, this.svg, this.alt});
  
  @override
  List<Object?> get props => [png, svg, alt];

}

class CountryName extends Equatable {
  final String? common;
  final String? official;

  const CountryName({this.common, this.official});

  @override
  List<Object?> get props => [common, official];
}
