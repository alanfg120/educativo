import 'package:dotted_border/dotted_border.dart';
import 'package:educativo/src/componentes/comesonidos/bloc/comesonidos_bloc.dart';
import 'package:educativo/src/componentes/comesonidos/models/ejercicio_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EjercicioComeSonido extends StatefulWidget {
  final String image;
  final List<EjercicioComesonidoClass> data;
  final String ejercicio;

  EjercicioComeSonido({this.image,this.data,this.ejercicio});
  @override
  _EjercicioComeSonidoState createState() => _EjercicioComeSonidoState();
}

class _EjercicioComeSonidoState extends State<EjercicioComeSonido> {

 
   
  @override
  Widget build(BuildContext context) {
    
    double heigthCaja = MediaQuery.of(context).size.height *  0.4;
    double heigthCaja1 = MediaQuery.of(context).size.height * 0.25;
    double heigthCaja2 = MediaQuery.of(context).size.height * 0.2;
    
    return  Container(
            width     : double.infinity,
            alignment : Alignment.center,
            child     : Column(
                        children: <Widget>[
                                  Container(
                                  height : heigthCaja2,
                                  child  : Image.asset(widget.image,fit: BoxFit.cover),
                                  margin : EdgeInsets.only(bottom: 20),
                                  ),
                                  Container(
                                  width  : double.infinity,
                                  height : heigthCaja1,
                                  child  : Wrap(
                                           runAlignment : WrapAlignment.start ,
                                           alignment    : WrapAlignment.spaceAround,
                                           runSpacing   : widget.data.length >4 ? 10 : 0,
                                           children     : widget.data.asMap()
                                                                .entries.map((e) => _dragTager(e.value,e.key)).toList()
                                  ),
                                 ),
                                 Container(
                                 margin : EdgeInsets.only(top:10.0),
                                 width  : double.infinity,
                                 height : heigthCaja,  
                                 child  : Wrap(
                                          runAlignment : WrapAlignment.start ,
                                          alignment    : WrapAlignment.spaceAround,
                                          runSpacing   : widget.data.length >3 ? 10 : 0,
                                          children     : widget.data.asMap()
                                                               .entries.map((e) => _drop(e.value,e.key)).toList()
                                                              ..shuffle()
                                 ),
                               )
                              ],
                        )
                        );
  }

Widget _dragTager(EjercicioComesonidoClass e,int i) {
         return DragTarget<String>(
                builder:(context, List<String> candidateData, rejectedData) {
                  return  e.accept
                          ? _texto(e.letra)
                          : _espacio();
                },
                onAccept: (data){
                   BlocProvider.of<ComesonidosBloc>(context).add(
                     AcceptLetraEvent(index: i,ejercicio: widget.ejercicio)
                   ); 
                },
                onLeave: (data){
                   
                },
                onWillAccept: (data){
                  return data == e.letra ? true : false;
                },
         );
  }

Widget _drop(EjercicioComesonidoClass e,int i) {
         return Draggable<String>(
                data              : e.letra,
                child             : !e.accept ? _texto(e.letra) : Container(),
                feedback          : _texto(e.letra),
                childWhenDragging : Container(),
                onDragCompleted   : ()=> setState((){}),
            
         );
  }

Widget _texto(String texto){
   return  texto.length > 1
           ? Container(
          color     : Colors.blue,
          width     : texto.length.toDouble()*30,
          height    : 50,
          alignment : Alignment.center,
          child     : Text(texto,
                      style: TextStyle(
                              color      :Colors.white,
                              fontSize   : 30,
                              decoration : TextDecoration.none
                      )
          )
          )
          : Container(
          color     : Colors.blue,
          width     : 50, 
          height    : 50,
          alignment : Alignment.center,
          child     : Text(texto,
                      style: TextStyle(
                              color      :Colors.white,
                              fontSize   : 30,
                              decoration : TextDecoration.none
                      )
          ),
   );
}

Widget _espacio(){
   return DottedBorder(
          color       : Colors.black,
          strokeWidth : 1,
          dashPattern : [6], 
          child       : Container(width: 50,height: 50),
   );
}

}