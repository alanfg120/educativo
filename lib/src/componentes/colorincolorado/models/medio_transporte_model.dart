import 'package:educativo/src/componentes/colorincolorado/models/item_model.dart';

class MedioTransporte implements Item {
  @override
  String image;

  @override
  String nombre;

  @override
  bool selecionado;
 
  MedioTransporte({this.image,this.nombre,this.selecionado});
}