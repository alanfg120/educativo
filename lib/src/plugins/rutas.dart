
import 'package:educativo/src/componentes/colorincolorado/vistas/colorin_page.dart';
import 'package:educativo/src/componentes/comesonidos/vistas/comesonidos_page.dart';
import 'package:educativo/src/componentes/home/vistas/home_page.dart';
import 'package:educativo/src/componentes/zoologico/vistas/zoologico_page.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> route() {
  return <String, WidgetBuilder>{
    'home'        : (context) => HomePage(),
    'comesonidos' : (context) => ComeSonidosPage(),
    'zoologico'   : (context) => ZoologicoPage(),
    'colorin'     : (context) => ColorinColoradoPage(),

  };
}
