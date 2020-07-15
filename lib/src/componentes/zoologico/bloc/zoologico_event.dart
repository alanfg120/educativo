part of 'zoologico_bloc.dart';

class ZoologicoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SelectAnimalEvent extends ZoologicoEvent {
  final bool select;
  final int index;
  SelectAnimalEvent({this.select, this.index});
  @override
  List<Object> get props => [select];
}

class SelectOptionAnimalEvent extends ZoologicoEvent {
  final String nombre;
  SelectOptionAnimalEvent({this.nombre});
  @override
  List<Object> get props => [nombre];
}

class SelectRespuestaEvent extends ZoologicoEvent {}

class RandomListAnimalEvent extends ZoologicoEvent {
  final String respuesta;
  RandomListAnimalEvent({this.respuesta});
  @override
  List<Object> get props => [respuesta];
}

class CalificarEvent extends ZoologicoEvent {
  final int respuesta;
  CalificarEvent({this.respuesta});
  @override
  List<Object> get props => [respuesta];
}

class SelectRadioEvent extends ZoologicoEvent {
  final int value;
  SelectRadioEvent({this.value});
  @override
  List<Object> get props => [value];
}

class VoltearTarjetaEvent extends ZoologicoEvent {
  final String tipo;
  final int index;
  VoltearTarjetaEvent({this.index,this.tipo});
  @override
  List<Object> get props => [index,tipo];
}

class VerificarTurnoEvent extends ZoologicoEvent {
  final String tipo;
  final int index;
  final String nombreTarjeta;
  VerificarTurnoEvent({this.index,this.nombreTarjeta,this.tipo});
  @override
  List<Object> get props => [index,nombreTarjeta,tipo];
}

class TranformTarjetaTextoEvent extends ZoologicoEvent{} 
