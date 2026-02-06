import 'package:StoreLink/bloc/counter_event.dart';
import 'package:StoreLink/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<counterevent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<increment>((event, emit) {
      emit(CounterState(state.count + 1));
    });
    on<decrement>((event, emit) {
      emit(CounterState(state.count - 1));
    });
    on<reset>((event, emit) {
      emit(CounterState(0));
    });
  }
}
