import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
part 'search_country_event.dart';
part 'search_country_state.dart';

class SearchCountryBloc extends Bloc<SearchCountryEvent, SearchCountryState> {
  SearchCountryBloc() : super(SearchCountryState.initial()) {
    on<SetSearchTermEvent>((event, emit) {
      emit(state.copyWith(searchTerm: event.newSearchItem));
    }, transformer: debounce(Duration(milliseconds: 2000)));
  }
  EventTransformer<SetSearchTermEvent> debounce<SetSearchTermEvent>(
      Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
