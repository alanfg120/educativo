import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:educativo/src/componentes/comesonidos/data/ejerccios_data.dart';
import 'package:educativo/src/componentes/comesonidos/models/ejercicio_model.dart';
import 'package:equatable/equatable.dart';


part 'comesonidos_event.dart';
part 'comesonidos_state.dart';

class ComesonidosBloc extends Bloc<ComeSonidosEvent, ComeSonidosState> {
  
  ComesonidosBloc() : super(ComeSonidosState.initial());

  @override
  Stream<ComeSonidosState> mapEventToState(
    ComeSonidosEvent event,
  ) async* {
    if (event is AcceptLetraEvent)       yield* _accepLetra(event, state);
    if (event is CompleteEjercicioEvent) yield* _completeEjercicio(state);
  }

  Stream<ComeSonidosState> _accepLetra(
      AcceptLetraEvent event, ComeSonidosState state) async* {
    int complete = 0;
    state.ejercicios[event.ejercicio][event.index].accept = true;
    state.ejercicios[event.ejercicio].forEach((e) {
      if (e.accept == true) complete++;
    });
    if (complete == state.ejercicios[event.ejercicio].length)
      add(CompleteEjercicioEvent());
    yield state.copyWith(ejercicios: state.ejercicios);
  }

  Stream<ComeSonidosState> _completeEjercicio(ComeSonidosState state) async* {
    if (state.progreso == 0)
      yield state.copyWith(progreso: 0.1111,currentpage: 1);
    else if (state.progreso < 1 && state.currentpage < 9) {
      yield state.copyWith(progreso: (state.progreso + 0.1111),currentpage: (state.currentpage + 1));
    }
  }
}
