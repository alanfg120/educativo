part of 'colorincolorado_bloc.dart';

class ColorinColoradoEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class ChangePageEvent extends ColorinColoradoEvent {
  final int page;
  final String action;
  ChangePageEvent({this.page, this.action});
  @override
  List<Object> get props => [page, action];
}


class SelectOpcionEvent extends ColorinColoradoEvent {
  final Item opcion;
  final int valueRadio;
  SelectOpcionEvent({this.opcion,this.valueRadio});
  @override
  List<Object> get props => [opcion,valueRadio];
}
class SelectEcenarioEvent extends ColorinColoradoEvent {
  final Ecenario ecenario;
  final int valueRadio;
  SelectEcenarioEvent({this.ecenario,this.valueRadio});
  @override
  List<Object> get props => [ecenario,valueRadio];
}
