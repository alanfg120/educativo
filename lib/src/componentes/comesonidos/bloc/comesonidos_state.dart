part of 'comesonidos_bloc.dart';

class ComeSonidosState extends Equatable {
  final double progreso;
  final bool bloqueado;
  final int numeroEjercicios;
  final Map<String, List<EjercicioComesonidoClass>> ejercicios;
  final int currentpage;

  ComeSonidosState(
      {this.progreso, this.bloqueado, this.ejercicios, this.numeroEjercicios,this.currentpage});

  factory ComeSonidosState.initial() => ComeSonidosState(
      progreso: 0,
      bloqueado: false,
      ejercicios: ejerciciosMap,
      numeroEjercicios: 9,
      currentpage     : 0);

  ComeSonidosState copyWith(
          {double progreso,
          bool bloque,
          Map<String, List<EjercicioComesonidoClass>> ejercicios,
          int numeroEjercicios,
          int currentpage}) =>
      ComeSonidosState(
          progreso: progreso     ?? this.progreso,
          bloqueado: bloqueado   ?? this.bloqueado,
          ejercicios: ejercicios ?? this.ejercicios,
          numeroEjercicios: numeroEjercicios ?? this.numeroEjercicios,
          currentpage : currentpage ?? this.currentpage );

  @override
  List<Object> get props => [progreso, bloqueado, ejercicios, numeroEjercicios,currentpage];
  @override
  String toString() => '$progreso';
}
