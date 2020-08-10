import 'package:educativo/src/componentes/colorincolorado/models/item_model.dart';

class PersonajePrincipal implements Item {

  @override
  String image;
  @override
  String nombre;
  @override
  bool selecionado;
 
  PersonajePrincipal({this.image,this.nombre,this.selecionado});



}