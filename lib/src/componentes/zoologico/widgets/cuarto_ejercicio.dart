import 'package:educativo/src/componentes/zoologico/bloc/zoologico_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CuartoEjercicioZoologico extends StatefulWidget {
  CuartoEjercicioZoologico({Key key}) : super(key: key);

  @override
  _CuartoEjercicioZoologicoState createState() => _CuartoEjercicioZoologicoState();
}

class _CuartoEjercicioZoologicoState extends State<CuartoEjercicioZoologico> with TickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
     _animationController = AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 5000),
    );
      
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ZoologicoBloc,ZoologicoState>(
          builder:(context,state)
                  => GridView.builder(
                     padding      : EdgeInsets.only(bottom: 80,top: 50),
                     itemCount    :state.tarjetaAnimales.length,
                     gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                     itemBuilder  : (context, i) => Container(
                                                    decoration: BoxDecoration(
                                                                border : Border.all(color : Colors.blueGrey)
                                                    ),
                                                    child: GestureDetector(
                                                           onTap: (){
                                                             if(!state.tarjetaAnimales[i].volteado)
                                                             context.bloc<ZoologicoBloc>().add(
                                                               VoltearTarjetaEvent(index: i,tipo: 'imagen')
                                                             );
                                                           },
                                                           child: Stack(
                                                                  alignment : Alignment.center,
                                                                  children  : <Widget>[
                                                                              Opacity(
                                                                              opacity: state.tarjetaAnimales[i].volteado ? 1.0 : 0.0,
                                                                              child  : Image.asset(
                                                                                       state.tarjetaAnimales[i].image,
                                                                                       width:  90,
                                                                                       height: 90
                                                                              ),
                                                                              ),
                                                                              Opacity(
                                                                              opacity: state.tarjetaAnimales[i].volteado ? 0.0 : 1.0,
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
             
      ),
    );
}
}