part of 'zoologico_bloc.dart';

class ZoologicoState extends Equatable {
  
  final List<Animal> animales;
  final bool select;
  final List<Animal> randomAnimales;
  final List<Animal> tarjetaAnimales;
  final List<Animal> tarjetaTextoAnimales;
  final int respuesta;
  final String respuestaCorrecta;
  final int valueRadio;
  final bool volteado;
  final double progreso;
  final int numeroEjercicios;
  final int currentpage;

  ZoologicoState(
      {this.animales,
      this.select,
      this.randomAnimales,
      this.respuesta,
      this.respuestaCorrecta,
      this.valueRadio,
      this.tarjetaAnimales,
      this.tarjetaTextoAnimales,
      this.volteado,
      this.progreso,
      this.numeroEjercicios,
      this.currentpage});

  factory ZoologicoState.initial() => ZoologicoState(
      animales          : animalesList,
      select            : false,
      volteado          : false,
      randomAnimales    : [],
      tarjetaAnimales   : [
                           ...animalesList.map((e) => e).toList()..shuffle(),
                           ...animalesList.map((e) => e).toList()..shuffle()
                          ],
      tarjetaTextoAnimales : [
                           ...animalesList.map((e) => e).toList()..shuffle(),
                           ...animalesList.map((e) => e).toList()..shuffle()
                         ],
      respuesta         : 0,
      respuestaCorrecta : 'indefinido',
      valueRadio        : -1,
      progreso          :  0,
      numeroEjercicios  :  5,
      currentpage       :  0);

  ZoologicoState copyWith(
          {List<Animal> animales,
          bool select,
          bool volteado,
          List<Animal> randomAnimales,
          List<Animal> tarjetaAnimales,
          List<Animal> tarjetaTextoAnimales,
          int respuesta,
          String respuestaCorrecta,
          int valueRadio,
          double progreso,
          int numeroEjercicios,
          int currentpage}) =>
      ZoologicoState( 
          animales             : animales          ?? this.animales,
          select               : select            ?? this.select,
          volteado             : volteado          ?? this.volteado,
          randomAnimales       : randomAnimales    ?? this.randomAnimales,
          tarjetaAnimales      : tarjetaAnimales   ?? this.tarjetaAnimales,
          tarjetaTextoAnimales : tarjetaTextoAnimales   ?? this.tarjetaTextoAnimales,
          respuesta            : respuesta         ?? this.respuesta,
          respuestaCorrecta    : respuestaCorrecta ?? this.respuestaCorrecta,
          valueRadio           : valueRadio        ?? this.valueRadio,
          progreso             : progreso          ?? this.progreso,
          numeroEjercicios     : numeroEjercicios  ?? this.numeroEjercicios,
          currentpage          : currentpage       ?? this.currentpage);

  @override
  List<Object> get props => [
  animales, 
  select,
  randomAnimales,
  respuesta,
  respuestaCorrecta,
  valueRadio,
  tarjetaAnimales,
  tarjetaTextoAnimales,
  volteado,
  progreso,
  numeroEjercicios,
  currentpage
  ];
  @override
  @override
  String toString() => '$respuesta';
 
}
