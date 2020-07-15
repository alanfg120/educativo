import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cantando_event.dart';
part 'cantando_state.dart';

class CantandoBloc extends Bloc<CantandoEvent, CantandoState> {
  CantandoBloc() : super(CantandoInitial());

  @override
  Stream<CantandoState> mapEventToState(
    CantandoEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
