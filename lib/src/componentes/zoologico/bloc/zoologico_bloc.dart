import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'zoologico_event.dart';
part 'zoologico_state.dart';

class ZoologicoBloc extends Bloc<ZoologicoEvent, ZoologicoState> {
  @override
  ZoologicoState get initialState => ZoologicoInitial();

  @override
  Stream<ZoologicoState> mapEventToState(
    ZoologicoEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
