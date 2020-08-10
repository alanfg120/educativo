import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:educativo/src/componentes/colorincolorado/data/personajes_data.dart';
import 'package:educativo/src/componentes/colorincolorado/models/ecenario_model.dart';
import 'package:educativo/src/componentes/colorincolorado/models/item_model.dart';
import 'package:educativo/src/componentes/colorincolorado/models/medio_transporte_model.dart';
import 'package:educativo/src/componentes/colorincolorado/models/objetos_model.dart';
import 'package:educativo/src/componentes/colorincolorado/models/personaje_principal_model.dart';
import 'package:educativo/src/componentes/colorincolorado/models/personaje_secundario_model.dart';
import 'package:equatable/equatable.dart';

part 'colorincolorado_event.dart';
part 'colorincolorado_state.dart';

class ColorinColoradoBloc extends Bloc<ColorinColoradoEvent, ColorinColoradoState> {
  ColorinColoradoBloc() : super(ColorinColoradoState.initial());

  @override
  Stream<ColorinColoradoState> mapEventToState(
    ColorinColoradoEvent event,
  ) async* {
    if(event is ChangePageEvent)      yield* _changePage(event,state);
    if(event is SelectOpcionEvent) yield* _selectOpcion(event,state);
  }
    

 Stream<ColorinColoradoState>  _changePage(
   ChangePageEvent event, ColorinColoradoState state)  async* {
    if(event.action == 'Anterior') 
          yield state.copyWith(currentPage: (event.page -1));
       if(event.action == 'Siguiente' && event.page < 5) 
          yield state.copyWith(currentPage: (event.page + 1));
   }

   Stream<ColorinColoradoState> _selectOpcion(
     SelectOpcionEvent event, ColorinColoradoState state)  async* {

       if(event.opcion is PersonajePrincipal)
          yield state.copyWith(personajePrincipal: event.opcion,radioPersonajePrincipal: event.valueRadio);
       if(event.opcion is PersonajeSecundario)
          yield state.copyWith(personajeSecundario: event.opcion,radioPersonajeSecundario: event.valueRadio);
       if(event.opcion is Ecenario)
          yield state.copyWith(ecenario: event.opcion,radioEcenarios: event.valueRadio);
       if(event.opcion is Objeto)
          yield state.copyWith(objeto: event.opcion,radioObjetos: event.valueRadio);
       if(event.opcion is MedioTransporte)
          yield state.copyWith(medioDetransporte: event.opcion,radioMedioTransporte: event.valueRadio);
     
     }
}
