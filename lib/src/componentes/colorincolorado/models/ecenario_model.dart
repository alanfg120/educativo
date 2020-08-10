import 'package:educativo/src/componentes/colorincolorado/models/item_model.dart';

class Ecenario implements Item {
  
  @override
  String image;
  @override
  String nombre;
  @override
  bool selecionado;
  
  Ecenario({this.image,this.nombre,this.selecionado});

}
