// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:countries/domain/entities/country.dart';

class CountryModel extends Country {
  
  final CountryNameModel? name;
  final String? region;
  final String? subRegion;
  final String? flag;
  final CountryFlagsModel? flags;

  const CountryModel({this.name, this.region, this.subRegion, this.flag, this.flags});

  factory CountryModel.fromJson(Map<String, dynamic> map) {
    return CountryModel(
        name: CountryNameModel.fromJson(map['name']),
        region: map['region'],
        subRegion: map['subregion'],
        flag: map['flag'],
        flags: CountryFlagsModel.fromJson(map['flags']));
  }
}

class CountryFlagsModel extends CountryFlags {
  final String? png;
  final String? svg;
  final String? alt;

  CountryFlagsModel({this.png, this.svg, this.alt});

  factory CountryFlagsModel.fromJson(Map<String, dynamic> map) {
    return CountryFlagsModel(png: map['png'], svg: map['svg'], alt: map['alt']);
  }
}

class CountryNameModel extends CountryName {
  final String? common;
  final String? official;

  const CountryNameModel({this.common, this.official});

  factory CountryNameModel.fromJson(Map<String, dynamic> map) {
    return CountryNameModel(
      common: map['common'],
      official: map['official'],
    );
  }
}
