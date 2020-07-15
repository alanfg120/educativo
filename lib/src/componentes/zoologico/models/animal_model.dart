import 'package:equatable/equatable.dart';

class Animal extends Equatable {
  
  final String nombre;
  final String pathAudio;
  final String image;
  final bool selecionado;
  final bool opcion;
  final bool volteado;
  final bool isText;

  Animal(
      {this.nombre,
      this.pathAudio,
      this.image,
      this.selecionado,
      this.opcion,
      this.volteado,
      this.isText});

  Animal copyWith(
          {String nombre,
          String pathAudio,
          String image,
          bool selecionado,
          bool opcion,
          bool volteado,
          bool isText}) =>
      Animal(
          image       : image       ?? this.image,
          nombre      : nombre      ?? this.nombre,
          opcion      : opcion      ?? this.opcion,
          pathAudio   : pathAudio   ?? this.pathAudio,
          selecionado : selecionado ?? this.selecionado,
          volteado    : volteado    ?? this.volteado,
          isText      : isText      ?? this.isText
          );
  @override
  List<Object> get props =>
      [nombre, pathAudio, image, selecionado, opcion, volteado,isText];
}
