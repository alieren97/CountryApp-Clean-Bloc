import 'package:bloc/bloc.dart';
import 'package:countries/domain/entities/country.dart';
import 'package:equatable/equatable.dart';

part 'selected_country_event.dart';
part 'selected_country_state.dart';

class SelectedCountryBloc
    extends Bloc<SelectedCountryEvent, SelectedCountryState> {
  Country? country;
  SelectedCountryBloc() : super(SelectedCountryState.initial()) {
    on<SelectCountryEvent>((event, emit) {
      country = event.country;
    });
  }
}
