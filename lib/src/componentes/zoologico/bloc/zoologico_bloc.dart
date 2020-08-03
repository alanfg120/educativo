import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:educativo/src/componentes/zoologico/data/animales_data.dart';
import 'package:educativo/src/componentes/zoologico/models/animal_model.dart';
import 'package:equatable/equatable.dart';

part 'zoologico_event.dart';
part 'zoologico_state.dart';

class ZoologicoBloc extends Bloc<ZoologicoEvent, ZoologicoState> {
  int turno = 0;
  int indexTarjeta;
  String nombreTarjeta;

  ZoologicoBloc() : super(ZoologicoState.initial());

  @override
  Stream<ZoologicoState> mapEventToState(
    ZoologicoEvent event,
  ) async* {
    if (event is SelectAnimalEvent)         yield* _selectAnimal(event, state);
    if (event is RandomListAnimalEvent)     yield* _randomListAnimal(event, state);
    if (event is SelectOptionAnimalEvent)   yield* _selectOptionAnimal(event, state);
    if (event is CalificarEvent)            yield* _calificar(event, state);
    if (event is SelectRadioEvent)          yield* _selectRadio(event, state);
    if (event is VoltearTarjetaEvent)       yield* _voltearTarjeta(event, state);
    if (event is VerificarTurnoEvent)       yield* _verificarTurno(event, state);
    if (event is TranformTarjetaTextoEvent) yield* _textoTarjeta(event, state);
    if (event is CompleteEjercicioEvent)    yield* _completeEjercicio(event,state);
    if (event is ChangePageEvent)           yield* _changePage(event,state);
    if (event is VerificarEjercicioEvent)   yield* _verificarEjercicio(event,state);

  }

  Stream<ZoologicoState> _selectAnimal(
      SelectAnimalEvent event, ZoologicoState state) async* {
    state.animales[event.index] =
        state.animales[event.index].copyWith(selecionado: event.select);
    yield state.copyWith(animales: state.animales);
  }

  Stream<ZoologicoState> _selectOptionAnimal(
      SelectOptionAnimalEvent event, ZoologicoState state) async* {
    for (var i = 0; i < state.randomAnimales.length; i++)
      state.randomAnimales[i] = state.randomAnimales[i].copyWith(opcion: false);
    final index =
        state.randomAnimales.indexWhere((e) => e.nombre == event.nombre);
    state.randomAnimales[index] =
        state.randomAnimales[index].copyWith(opcion: true);
    yield state.copyWith(randomAnimales: state.randomAnimales, select: true);
    yield state.copyWith(select: false);
  }

  Stream<ZoologicoState> _randomListAnimal(
      RandomListAnimalEvent event, ZoologicoState state) async* {

    final randomFirsList = state.animales.map((e) => e).toList();
    randomFirsList..shuffle();
    final indexLeon =
        randomFirsList.indexWhere((e) => e.nombre == event.respuesta);
    if (indexLeon < 4) {
      yield state.copyWith(
          randomAnimales: randomFirsList.take(4).toList(),
          respuesta: indexLeon,
          respuestaCorrecta: 'indefinido');
    } else {
      if (event.respuesta == 'Leon') randomFirsList.insert(0, animalesList[0]);
      if (event.respuesta == 'Elefante')
        randomFirsList.insert(0, animalesList[1]);

      final randomSeconsList = randomFirsList.map((e) => e).take(4).toList();
      randomSeconsList..shuffle();
      final respuesta =
          randomSeconsList.indexWhere((e) => e.nombre == event.respuesta);
      print(respuesta);
      yield state.copyWith(
          randomAnimales: randomSeconsList,
          respuesta: respuesta,
          respuestaCorrecta: 'indefinido');
    }
  }

  Stream<ZoologicoState> _calificar(
      CalificarEvent event, ZoologicoState state) async* {
    if (event.respuesta == state.respuesta)
      yield state.copyWith(respuestaCorrecta: 'correcto');
    else
      yield state.copyWith(respuestaCorrecta: 'incorrecto');
  }

  Stream<ZoologicoState> _selectRadio(
      SelectRadioEvent event, ZoologicoState state) async* {
    add(CalificarEvent(respuesta: event.value));
    yield state.copyWith(valueRadio: event.value);
  }

  Stream<ZoologicoState> _voltearTarjeta(
      VoltearTarjetaEvent event, ZoologicoState state) async* {
    turno++;
    if (event.tipo == 'imagen') {
        if (turno <= 1) {
        indexTarjeta = event.index;
        nombreTarjeta = state.tarjetaAnimales[event.index].nombre;
       }

      state.tarjetaAnimales[event.index] =
          state.tarjetaAnimales[event.index].copyWith(volteado: true);
      yield state.copyWith(
          tarjetaAnimales: state.tarjetaAnimales, volteado: true);
      yield state.copyWith(volteado: false);
      if (turno == 2)
        Future.delayed(const Duration(milliseconds: 700), () {
          add(VerificarTurnoEvent(
              index: event.index,
              nombreTarjeta: state.tarjetaAnimales[event.index].nombre,
              tipo: event.tipo));
        });
      if (turno > 2)
        state.tarjetaAnimales[event.index] =
            state.tarjetaAnimales[event.index].copyWith(volteado: false);
    }
    if (event.tipo == 'texto') {
      if (turno <= 1) {
        indexTarjeta = event.index;
        nombreTarjeta = state.tarjetaTextoAnimales[event.index].nombre;
      }

      state.tarjetaTextoAnimales[event.index] =
          state.tarjetaTextoAnimales[event.index].copyWith(volteado: true);
      yield state.copyWith(
          tarjetaTextoAnimales: state.tarjetaTextoAnimales, volteado: true);
      yield state.copyWith(volteado: false);
      if (turno == 2)
        Future.delayed(const Duration(milliseconds: 700), () {
          add(VerificarTurnoEvent(
              index: event.index,
              nombreTarjeta: state.tarjetaTextoAnimales[event.index].nombre,
              tipo: event.tipo));
        });
      if (turno > 2)
        state.tarjetaTextoAnimales[event.index] =
            state.tarjetaTextoAnimales[event.index].copyWith(volteado: false);
    }
  }

  Stream<ZoologicoState> _verificarTurno(
      VerificarTurnoEvent event, ZoologicoState state) async* {
    if (event.tipo == 'imagen') {
      if (event.nombreTarjeta == nombreTarjeta)
        yield state.copyWith(tarjetaAnimales: state.tarjetaAnimales);
      else {
        state.tarjetaAnimales[event.index] =
            state.tarjetaAnimales[event.index].copyWith(volteado: false);
        state.tarjetaAnimales[indexTarjeta] =
            state.tarjetaAnimales[indexTarjeta].copyWith(volteado: false);
        yield state.copyWith(
            tarjetaAnimales: state.tarjetaAnimales, volteado: true);
        yield state.copyWith(volteado: true);
      }
    }
    if (event.tipo == 'texto') {
      if (event.nombreTarjeta == nombreTarjeta)
        yield state.copyWith(tarjetaTextoAnimales: state.tarjetaTextoAnimales);
      else {
        state.tarjetaTextoAnimales[event.index] =
            state.tarjetaTextoAnimales[event.index].copyWith(volteado: false);
        state.tarjetaTextoAnimales[indexTarjeta] =
            state.tarjetaTextoAnimales[indexTarjeta].copyWith(volteado: false);
        yield state.copyWith(
            tarjetaTextoAnimales: state.tarjetaTextoAnimales, volteado: true);
        yield state.copyWith(volteado: true);
      }
    }
    turno = 0;
  }

  Stream<ZoologicoState> _textoTarjeta(
      TranformTarjetaTextoEvent event, ZoologicoState state) async* {
    for (var i = 0; i < state.tarjetaTextoAnimales.length; i++) {
      state.tarjetaTextoAnimales[i] =
          state.tarjetaTextoAnimales[i].copyWith(isText: false);
    }
    List posiciones = [0, 1, 2, 3, 4, 5];
    List randomPosiciones = posiciones.map((e) => e).toList()..shuffle();
    List finalPosiciones = randomPosiciones.toList();
    for (var i = 0; i < finalPosiciones.length; i++) {
      state.tarjetaTextoAnimales[finalPosiciones[i]] =
          state.tarjetaTextoAnimales[finalPosiciones[i]].copyWith(isText: true);
    }
    state.tarjetaTextoAnimales..shuffle();
    yield state.copyWith(tarjetaTextoAnimales: state.tarjetaTextoAnimales, select: true);
    yield state.copyWith(select: false);
  }

 Stream<ZoologicoState> _completeEjercicio(
    CompleteEjercicioEvent event, ZoologicoState state) async* {
       if (state.progreso == 0)
      yield state.copyWith(progreso: 0.2);
    else if (state.progreso < 1) {
      yield state.copyWith(progreso: (state.progreso + 0.2));
    }
    }

  Stream<ZoologicoState> _changePage(
    ChangePageEvent event, ZoologicoState state) async*{
       if(event.action == 'Anterior') 
          yield state.copyWith(currentpage: (event.page -1));
       if(event.action == 'Siguiente' && event.page < 4) 
          yield state.copyWith(currentpage: (event.page + 1));
     }

   Stream<ZoologicoState> _verificarEjercicio(
     VerificarEjercicioEvent event, ZoologicoState state)  async* {
      
      switch (event.page) {
                case 0 :  int selecionados = 0;
                          state.animales.forEach((animal) { 
                             if(animal.selecionado)
                               selecionados ++;
                          });
                          if(selecionados>0)
                            add(CompleteEjercicioEvent());
                          break;
                case 1 :  if(state.respuestaCorrecta == 'correcto'){
                            add(CompleteEjercicioEvent());
                            yield state.copyWith(respuestaCorrecta: 'indefinido');
                           }
                          break;
                case 2 :  if(state.respuestaCorrecta == 'correcto'){
                            add(CompleteEjercicioEvent());
                            yield state.copyWith(respuestaCorrecta: 'indefinido');
                           }
                          break;
                case 3 :  int volteados = 0;
                          state.tarjetaAnimales.forEach((animal) { 
                            if(animal.volteado)
                               volteados++;
                          });
                          if(volteados == 12)
                          add(CompleteEjercicioEvent());
                          break;
                case 4 :  int volteados = 0;
                          state.tarjetaTextoAnimales.forEach((animal) { 
                            if(animal.volteado)
                               volteados++;
                          });
                          if(volteados == 12)
                          add(CompleteEjercicioEvent());
                          break;
        default:          break;
      }

     }
}
