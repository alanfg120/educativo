import 'package:educativo/src/componentes/zoologico/bloc/zoologico_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CuartoEjercicioZoologico extends StatefulWidget {
  final ZoologicoState state;
  CuartoEjercicioZoologico({Key key,this.state}) : super(key: key);

  @override
  _CuartoEjercicioZoologicoState createState() => _CuartoEjercicioZoologicoState();
}

class _CuartoEjercicioZoologicoState extends State<CuartoEjercicioZoologico> with TickerProviderStateMixin{




  @override
  Widget build(BuildContext context) {

    return 
       GridView.builder(
                     padding      : EdgeInsets.only(bottom: 80,top: 50),
                     itemCount    : widget.state.tarjetaAnimales.length,
                     gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                     itemBuilder  : (context, i) => Container(
                                                    decoration: BoxDecoration(
                                                                border : Border.all(color : Colors.blueGrey)
                                                    ),
                                                    child: GestureDetector(
                                                           onTap: (){
                                                             if(!widget.state.tarjetaAnimales[i].volteado)
                                                             context.bloc<ZoologicoBloc>().add(
                                                               VoltearTarjetaEvent(index: i,tipo: 'imagen')
                                                             );
                                                           },
                                                           child: Stack(
                                                                  alignment : Alignment.center,
                                                                  children  : <Widget>[
                                                                              Opacity(
                                                                              opacity: widget.state.tarjetaAnimales[i].volteado ? 1.0 : 0.0,
                                                                              child  : Image.asset(
                                                                                       widget.state.tarjetaAnimales[i].image,
                                                                                       width:  90,
                                                                                       height: 90
                                                                              ),
                                                                              ),
                                                                              Opacity(
                                                                              opacity: widget.state.tarjetaAnimales[i].volteado ? 0.0 : 1.0,
                                                                              child  : Image.asset(
                                                                                      'assets/interrogacion.png',
                                                                                       width:  90,
                                                                                       height: 90
                                                                              ),
                                                                              )
                                                                  ],
                                                           )
                                                    ),
                     ),
             
      );
    
}
}