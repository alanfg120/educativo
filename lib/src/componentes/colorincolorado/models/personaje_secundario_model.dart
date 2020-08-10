import 'package:educativo/src/componentes/colorincolorado/models/item_model.dart';

class PersonajeSecundario implements Item {

  @override
  String image;
  @override
  String nombre;
  @override
  bool selecionado;
 
  PersonajeSecundario({this.image,this.nombre,this.selecionado});



}