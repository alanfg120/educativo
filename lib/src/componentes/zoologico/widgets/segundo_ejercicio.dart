import 'package:audioplayers/audio_cache.dart';
import 'package:educativo/src/componentes/zoologico/bloc/zoologico_bloc.dart';
import 'package:educativo/src/componentes/zoologico/models/animal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SegundoEjercicioZoologico extends StatefulWidget {
  final AudioCache audio;
  SegundoEjercicioZoologico({this.audio});
  @override
  _SegundoEjercicioZoologicoState createState() =>
      _SegundoEjercicioZoologicoState();
}

class _SegundoEjercicioZoologicoState extends State<SegundoEjercicioZoologico> {
  int orden = 0;
  int respuesta;
  @override
  Widget build(BuildContext context) {
      context.bloc<ZoologicoBloc>().add(
        RandomListAnimalEvent(respuesta: 'Leon')
      );
    return BlocBuilder<ZoologicoBloc,ZoologicoState>(
          builder:(context,state)=> Column(
             children: <Widget>[
                        Padding(
                        padding : EdgeInsets.all(15),
                        child   : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                             Text('Como es el rugido del leon',style: TextStyle(fontSize: 20)),
                                             GestureDetector(
                                             onTap: () => widget.audio.play('audios/leon.mp3'),
                                             child: Image.asset('assets/sonido.png',
                                                    width  : 50,
                                                    height : 50,
                                             ),
                                             )
                                  ],
                        ),
                        ),
                        _opciones(state.randomAnimales),
                        _selecionar(),
                        _solucion(state.respuestaCorrecta)
             ],
      ),
    );
  }

  Widget _opciones(List<Animal> animales) {
    return Padding(
           padding : EdgeInsets.all(8.0),
           child   : Column(
                     children: animales.asMap().entries.take(4).map((e) => _opcion(e.key, e.value)).toList(),
           ),
    );
  }

  Widget _opcion(int i,Animal animal){
 
     return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                       Text('${i+1})',style: TextStyle(fontSize: 20)),
                       SizedBox(
                       width : 150,
                       child : RaisedButton(
                               shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)
                               ),
                               color     : animal.opcion ? Colors.red : Colors.green,
                               onPressed : () =>_playSelectAudio(animal.pathAudio,animal.nombre,i),
                               child     : Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           children: <Widget>[Icon(Icons.play_arrow), Text("Play",style: TextStyle(color: Colors.white))]
                                          ),
                ),    
              )
            ],
          );
   
  }

  _playSelectAudio(String pathAudio,String nombre, int i){
    context.bloc<ZoologicoBloc>().add(
      SelectOptionAnimalEvent(nombre: nombre)
    );
    if(pathAudio != 'undefined')
       widget.audio.play(pathAudio);
     respuesta = i;
  }

 Widget _selecionar() {
       return   Padding(
                padding:  EdgeInsets.all(10.0),
                child: OutlineButton(
                        onPressed:(){
                          context.bloc<ZoologicoBloc>().add(
                            CalificarEvent(respuesta: respuesta)
                          );
                        },
                        child: Text("Selecionar"),
                        shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(30),
                          
                        ),
                        borderSide: BorderSide(color:Colors.green),
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
                                   Text('Inorrecto',style:TextStyle(fontSize: 35)),
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
