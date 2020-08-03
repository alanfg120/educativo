import 'package:educativo/src/componentes/zoologico/bloc/zoologico_bloc.dart';
import 'package:educativo/src/componentes/zoologico/models/animal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuintoEjercicioZoologico extends StatefulWidget {
  final ZoologicoState state;
  QuintoEjercicioZoologico({Key key,this.state}) : super(key: key);

  @override
  _QuintoEjercicioZoologicoState createState() => _QuintoEjercicioZoologicoState();
}

class _QuintoEjercicioZoologicoState extends State<QuintoEjercicioZoologico> {
  
  @override
  Widget build(BuildContext context) {
    return   GridView.builder(
                     padding      : EdgeInsets.only(bottom: 80,top: 50),
                     itemCount    : widget.state.tarjetaAnimales.length,
                     gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                     itemBuilder  : (context, i) => Container(
                                                    decoration: BoxDecoration(
                                                                border : Border.all(color : Colors.blueGrey)
                                                    ),
                                                    child: GestureDetector(
                                                           onTap: (){
                                                             if(!widget.state.tarjetaTextoAnimales[i].volteado)
                                                             context.bloc<ZoologicoBloc>().add(
                                                               VoltearTarjetaEvent(index: i,tipo: 'texto')
                                                             );
                                                           },
                                                           child: _tarjetasList(widget.state.tarjetaTextoAnimales,i)
                                                    ),
                     ),
             
      );
    
  }

 Widget _tarjetasList(List<Animal> tarjetaAnimales, int i) {

  return Stack(
         alignment: Alignment.center,
         children: <Widget>[
                   Opacity(
                   opacity : tarjetaAnimales[i].volteado ? 1.0 : 0.0,
                   child   : tarjetaAnimales[i].isText
                             ? Container(
                               alignment : Alignment.center,
                               width     :  100,
                               height    : 100,
                               child     :  Text(tarjetaAnimales[i].nombre,style:TextStyle(fontSize: 22)),
                               )
                              : Image.asset(
                                 tarjetaAnimales[i].image,
                                 width  : 90,
                                 height : 90,
                                ),
                   ),
                   Opacity(
                   opacity : tarjetaAnimales[i].volteado ? 0.0 : 1.0,
                   child   : Image.asset(
                             'assets/interrogacion.png',
                              width  : 90,
                              height : 90,
                             ),
                   )
         ],
 );
}
}