
import 'package:educativo/src/componentes/home/vistas/home_page.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> route() {
  return <String, WidgetBuilder>{
    'home'     : (context) => HomePage(),

  };
}
