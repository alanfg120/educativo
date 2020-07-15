part of 'comesonidos_bloc.dart';

class ComeSonidosState extends Equatable {
  final double progreso;
  final bool bloqueado;
  final int numeroEjercicios;
  final Map<String, List<EjercicioComesonidoClass>> ejercicios;

  ComeSonidosState(
      {this.progreso, this.bloqueado, this.ejercicios, this.numeroEjercicios});

  factory ComeSonidosState.initial() => ComeSonidosState(
      progreso: 0,
      bloqueado: false,
      ejercicios: ejerciciosMap,
      numeroEjercicios: 9);

  ComeSonidosState copyWith(
          {double progreso,
          bool bloque,
          Map<String, List<EjercicioComesonidoClass>> ejercicios,
          int numeroEjercicios}) =>
      ComeSonidosState(
          progreso: progreso     ?? this.progreso,
          bloqueado: bloqueado   ?? this.bloqueado,
          ejercicios: ejercicios ?? this.ejercicios,
          numeroEjercicios: numeroEjercicios ?? this.numeroEjercicios);

  @override
  List<Object> get props => [progreso, bloqueado, ejercicios, numeroEjercicios];
  @override
  String toString() => '$progreso';
}
