import 'package:audioplayers/audio_cache.dart';
import 'package:educativo/src/componentes/colorincolorado/bloc/colorincolorado_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpcionesCuentoPage extends StatefulWidget {

  final AudioCache audio;
  final List opciones;
  final int radioValue;
  final String pathAudio,
               titulo;
  OpcionesCuentoPage(
   {Key key,this.audio,this.opciones,this.radioValue,this.pathAudio,this.titulo}) : super(key: key);
  
    @override
    _OpcionesCuentoState createState() => _OpcionesCuentoState();
  }
  


class _OpcionesCuentoState extends State<OpcionesCuentoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
                children: <Widget>[
                          Padding(
                          padding : EdgeInsets.all(15),
                          child   : Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                               Text(widget.titulo,style: TextStyle(fontSize: 20)),
                                               GestureDetector(
                                               onTap: () => widget.audio.play(widget.pathAudio),
                                               child: Image.asset('assets/sonido.png',
                                                      width  : 50,
                                                      height : 50,
                                               ),
                                               ),
                                            
                                    ],
                        ),
                        ),
                        _personajes()
                     
             ],
      
          
    );
  }

 Widget _personajes() {
  return  Expanded(
          child: GridView.builder(
                     padding      : EdgeInsets.only(bottom: 80),
                     itemCount    : widget.opciones.length,
                     gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                     itemBuilder  : (context, i) => Column(
                                                  children: <Widget>[
                                                   
                                                      Image.asset(
                                                      widget.opciones[i].image,
                                                      width  : 100,
                                                      height : 100,
                                                      fit    : BoxFit.contain,
                                                      ),
                                                      Radio(
                                                      groupValue: widget.radioValue,
                                                      value: i, 
                                                      onChanged: (value){
                                                         context.bloc<ColorinColoradoBloc>().add(
                                                           SelectOpcionEvent(
                                                           opcion: widget.opciones[i],
                                                           valueRadio: i
                                                           )
                                                        );
                                                      }
                                                      )

                                               
                                                  ],
                     ),
                     
              ),
       );
 }
}