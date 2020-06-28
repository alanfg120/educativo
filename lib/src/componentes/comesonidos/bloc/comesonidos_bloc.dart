import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:educativo/src/componentes/comesonidos/data/ejerccios_data.dart';
import 'package:educativo/src/componentes/comesonidos/models/ejercicio_model.dart';
import 'package:equatable/equatable.dart';

part 'comesonidos_event.dart';
part 'comesonidos_state.dart';

class ComesonidosBloc extends Bloc<ComeSonidosEvent, ComeSonidosState> {
  @override
  ComeSonidosState get initialState => ComeSonidosState.initial();

  @override
  Stream<ComeSonidosState> mapEventToState(
    ComeSonidosEvent event,
  ) async* {
    if (event is AcceptLetraEvent) yield* _accepLetra(event, state);
  }

  Stream<ComeSonidosState> _accepLetra(
      AcceptLetraEvent event, ComeSonidosState state) async* {
        state.ejercicios[event.ejercicio][event.index].accept=true;
        yield state.copyWith(ejercicios: state.ejercicios);
      }
}
