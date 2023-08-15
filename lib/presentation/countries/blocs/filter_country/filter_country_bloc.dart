import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_country_event.dart';
part 'filter_country_state.dart';

class FilterCountryBloc extends Bloc<FilterCountryEvent, FilterCountryState> {
  FilterCountryBloc() : super(FilterCountryState.initial()) {
    on<ChangeFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
  }
}
