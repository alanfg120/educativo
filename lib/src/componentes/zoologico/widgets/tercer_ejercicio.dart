import 'package:audioplayers/audio_cache.dart';
import 'package:educativo/src/componentes/zoologico/bloc/zoologico_bloc.dart';
import 'package:educativo/src/componentes/zoologico/models/animal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TercerEjercicioZoologico extends StatefulWidget {
  final AudioCache audio;
  final ZoologicoState state;
  TercerEjercicioZoologico({Key key,this.audio,this.state}) : super(key: key);

  @override
  _TercerEjercicioZoologicoState createState() => _TercerEjercicioZoologicoState();
}

class _TercerEjercicioZoologicoState extends State<TercerEjercicioZoologico> {
  @override
  Widget build(BuildContext context) {
        return Column(
               children: <Widget>[
                         _adivinanza(),
                         _opciones(widget.state.randomAnimales,widget.state.valueRadio),
                         _solucion(widget.state.respuestaCorrecta)
              ],
      );
    
  }

 Widget _adivinanza() {
     return Container(
       margin : EdgeInsets.only(bottom: 20),
       padding: EdgeInsets.all(8.0),
       child: Row(
              children: <Widget>[
                         Flexible(
                         child: Text("Cual es el animal con la trompa bien elegante,tiene las patas gigantes ese animal es bien grande",
                                      style: TextStyle(fontSize: 20),
                                    )
                         ),
                          GestureDetector(
                          onTap: () => widget.audio.play('audios/adivinanza.mp3'),
                          child: Image.asset('assets/sonido.png',
                                 width  : 50,
                                 height : 50,
                          ),
                          )
              ],
       ),
     );
 }

Widget _opciones(List<Animal> animales,int radioValue) {
    return Expanded(
          child: GridView.builder(
                       padding      : EdgeInsets.only(bottom: 80),
                       itemCount    : animales.length,
                       gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                       itemBuilder  : (context, i) => Column(
                                                    children: <Widget>[
                                                        Image.asset(
                                                        animales[i].image,
                                                        width  : 60,
                                                        height : 60,
                                                        fit    : BoxFit.contain,
                                                        ),
                                                        Radio(
                                                        groupValue: radioValue,
                                                        value     : i, 
                                                        onChanged : (value){
                                                          context.bloc<ZoologicoBloc>().add(
                                                             SelectRadioEvent(value: i)
                                                          );
                                                        }
                                                        )
                                                    ],
                       ),
                       
                ),
    );

}

Widget _solucion(String respuesta) {

   List<Widget> mensaje;

   switch (respuesta) {
       case  'correcto' : mensaje = [
                                   Text('Correcto',style:TextStyle(fontSize: 35)),
                                   SizedBox(width: 10),
                                   Icon(Icons.done,size: 45,color: Colors.green)
                                   ];
                           break;
       case  'incorrecto': mensaje = [
                                   Text('Incorrecto',style:TextStyle(fontSize: 35)),
                                   SizedBox(width: 10),
                                   Icon(Icons.remove_circle,size: 45,color: Colors.red)
                                   ];
                           break;
       default            : mensaje = [];
     }


      return Expanded(
        child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: mensaje
                        
        )
      );
 }
}