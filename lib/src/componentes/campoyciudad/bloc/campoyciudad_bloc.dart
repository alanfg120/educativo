import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'campoyciudad_event.dart';
part 'campoyciudad_state.dart';

class CampoyCiudadBloc extends Bloc<CampoyCiudadEvent, CampoyCiudadState> {


  CampoyCiudadBloc() : super(CampoyciudadInitial());


  @override
  Stream<CampoyCiudadState> mapEventToState(
    CampoyCiudadEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
