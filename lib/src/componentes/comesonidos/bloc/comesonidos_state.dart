part of 'comesonidos_bloc.dart';

class ComeSonidosState extends Equatable {
  final double progreso;
  final bool bloqueado;
  final Map<String, List<EjercicioComesonidoClass>> ejercicios;

  ComeSonidosState({this.progreso, this.bloqueado, this.ejercicios});

  factory ComeSonidosState.initial() => ComeSonidosState(
      progreso: 0, bloqueado: false, ejercicios: ejerciciosMap);

  ComeSonidosState copyWith({double progreso, bool bloque, List<String> mesa,
          Map<String, List<EjercicioComesonidoClass>> ejercicios}) =>
      ComeSonidosState(
          progreso  : progreso ?? this.progreso, 
          bloqueado : bloqueado ?? this.bloqueado,
          ejercicios: ejercicios ?? this.ejercicios
          );

  @override
  List<Object> get props => [progreso,bloqueado,ejercicios];
}
