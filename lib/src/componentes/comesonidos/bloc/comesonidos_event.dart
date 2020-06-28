part of 'comesonidos_bloc.dart';

 class ComeSonidosEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AcceptLetraEvent extends ComeSonidosEvent{
  final String ejercicio;
  final int index;
  AcceptLetraEvent({this.index,this.ejercicio});
    @override
  List<Object> get props => [index,ejercicio];
}