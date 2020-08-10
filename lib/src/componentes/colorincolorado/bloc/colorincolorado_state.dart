part of 'colorincolorado_bloc.dart';

class ColorinColoradoState extends Equatable {

  final double progreso;
  final List<PersonajePrincipal>  personajesPrincipales;
  final List<PersonajeSecundario> personajesSecundarios;
  final List<Ecenario> ecenarios;
  final List<Objeto>   objetosOpciones;
  final List<MedioTransporte> mediosTransportes;
  final int currentPage,
            numeroEjercicios,
            radioPersonajePrincipal,
            radioPersonajeSecundario,
            radioEcenarios,
            radioObjetos,
            radioMedioTransporte;

  final PersonajePrincipal  personajePrincipal;
  final PersonajeSecundario personajeSecundario;
  final Ecenario  ecenario;
  final Objeto    objeto;
  final MedioTransporte medioDeTransporte;

  ColorinColoradoState(
      {this.progreso,
      this.numeroEjercicios,
      this.currentPage,
      this.personajesPrincipales,
      this.personajesSecundarios,
      this.ecenarios,
      this.objetosOpciones,
      this.mediosTransportes,
      this.radioPersonajePrincipal,
      this.radioPersonajeSecundario,
      this.radioEcenarios,
      this.radioMedioTransporte,
      this.radioObjetos,
      this.personajePrincipal,
      this.personajeSecundario,
      this.ecenario,
      this.objeto,
      this.medioDeTransporte});

  factory ColorinColoradoState.initial() => ColorinColoradoState(
      progreso                : 0.0,
      numeroEjercicios        : 0,
      currentPage             : 0,
      personajesPrincipales   : personajesPrincipalData,
      personajesSecundarios   : personajeSecundarioData,
      ecenarios               : ecenarioData,
      objetosOpciones         : objetoData,
      mediosTransportes       : medioTransporteData,
      radioPersonajePrincipal : -1,
      radioPersonajeSecundario: -1,
      radioEcenarios          : -1,
      radioObjetos            : -1,
      radioMedioTransporte    : -1);

  ColorinColoradoState copyWith(

          {double progreso,
          int numeroEjercicios,
          int currentPage,
          List<PersonajePrincipal> personajesPrincipales,
          List<PersonajeSecundario> personajesSecundarios,
          List<Ecenario>  ecenarios,
          List<Objeto>    objetoOpciones,
          List<MedioTransporte> mediosTransportes,
          int radioPersonajePrincipal,
          int radioPersonajeSecundario,
          int radioEcenarios,
          int radioObjetos,
          int radioMedioTransporte,
          PersonajePrincipal personajePrincipal,
          PersonajeSecundario personajeSecundario,
          Ecenario ecenario,
          Objeto objeto,
          MedioTransporte medioDetransporte}) =>
      
      ColorinColoradoState(
          progreso                 : progreso                 ?? this.progreso,
          numeroEjercicios         : numeroEjercicios         ?? this.numeroEjercicios,
          currentPage              : currentPage              ?? this.currentPage,
          personajesPrincipales    : personajesPrincipales    ?? this.personajesPrincipales,
          personajesSecundarios    : personajesSecundarios    ?? this.personajesSecundarios,
          ecenarios                : ecenarios                ?? this.ecenarios,
          objetosOpciones          : objetosOpciones          ?? this.objetosOpciones,
          mediosTransportes        : mediosTransportes        ?? this.mediosTransportes,
          radioPersonajePrincipal  : radioPersonajePrincipal  ?? this.radioPersonajePrincipal,
          radioPersonajeSecundario : radioPersonajeSecundario ?? this.radioPersonajeSecundario,
          radioObjetos             : radioObjetos             ?? this.radioObjetos,
          radioEcenarios           : radioEcenarios           ?? this.radioEcenarios,
          radioMedioTransporte     : radioMedioTransporte     ?? this.radioMedioTransporte,
          personajePrincipal       : personajePrincipal       ?? this.personajePrincipal,
          personajeSecundario      : personajeSecundario      ?? this.personajeSecundario,
          ecenario                 : ecenario                 ?? this.ecenario,
          objeto                   : objeto                   ?? this.objeto);

  @override
  List<Object> get props =>
      [
       progreso, 
       numeroEjercicios, 
       currentPage, 
       personajesPrincipales,
       personajesSecundarios,
       ecenarios,
       objetosOpciones,
       radioPersonajePrincipal,
       radioEcenarios,
       radioObjetos,
       radioMedioTransporte,
       personajePrincipal,
       personajeSecundario,
       ecenario,
       objeto,
       medioDeTransporte
      ];
}
