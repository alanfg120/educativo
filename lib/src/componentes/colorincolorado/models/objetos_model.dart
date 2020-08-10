import 'package:educativo/src/componentes/colorincolorado/models/item_model.dart';

class Objeto implements Item {
  @override
  String image;

  @override
  String nombre;

  @override
  bool selecionado;

  Objeto({this.image,this.nombre,this.selecionado});
}
