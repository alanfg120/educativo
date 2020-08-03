import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is DesbloquearJuegoEvent) yield* _desbloquearJuego(event, state);
  }

  Stream<HomeState> _desbloquearJuego(
      DesbloquearJuegoEvent event, HomeState state) async*{
        state.bloqueoJuego[event.index] = false;
        yield state.copyWith(bloqueoJuego: state.bloqueoJuego);
      }
}
