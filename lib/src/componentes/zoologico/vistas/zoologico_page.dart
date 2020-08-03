import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:educativo/src/componentes/zoologico/bloc/zoologico_bloc.dart';
import 'package:educativo/src/componentes/zoologico/widgets/cuarto_ejercicio.dart';
import 'package:educativo/src/componentes/zoologico/widgets/primer_ejercicio.dart';
import 'package:educativo/src/componentes/zoologico/widgets/quinto_ejercicio.dart';
import 'package:educativo/src/componentes/zoologico/widgets/segundo_ejercicio.dart';
import 'package:educativo/src/componentes/zoologico/widgets/tercer_ejercicio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void audioPlayerHandler(AudioPlayerState value) => print('state => $value');

class ZoologicoPage extends StatefulWidget {
  @override
  _ZoologicoPageState createState() => _ZoologicoPageState();
}

class _ZoologicoPageState extends State<ZoologicoPage> {

  AudioPlayer _audioPlayer = AudioPlayer();
  AudioCache  _audioCache   = AudioCache();

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      _audioPlayer.monitorNotificationStateChanges(audioPlayerHandler);
    }
  }
   @override
  void dispose() {
    super.dispose();

  }
  @override
  Widget build(BuildContext context) { 
    return BlocBuilder<ZoologicoBloc,ZoologicoState>(
    builder: (context,state)
     => Scaffold(
       body : SafeArea(
             child: Stack(
                    children: <Widget>[
                              Positioned(
                              child: IconButton(
                                     icon: Icon(Icons.arrow_back_ios), 
                                     onPressed: ()=>Navigator.pop(context)
                                     )
                              ),
                              Padding(
                              padding: EdgeInsets.only(top:40),
                              child  : AnimatedSwitcher(
                                       duration: Duration(milliseconds: 600),
                                       child: IndexedStack(
                                              key: ValueKey<int>(state.currentpage),
                                              index: state.currentpage,
                                              children: <Widget>[
                                                    PrimerEjercicioZoologico(audio: _audioCache),
                                                    SegundoEjercicioZoologico(audio: _audioCache,state: state),
                                                    TercerEjercicioZoologico(audio: _audioCache,state:state),
                                                    CuartoEjercicioZoologico(state: state),
                                                    QuintoEjercicioZoologico(state: state,)
                                              ],
                                       ),
                                       ), 
                              )
                    ],
              ),
       
      ),
      bottomSheet: _changePage(state.currentpage),
              
     
       
      )
    );
  }

 Widget _changePage(int currentPage) {
   return SafeArea(
          child: Container(
                 height : 90,
                 child  : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:<Widget>[
                           currentPage > 0 
                           ? _buttonPage('Anterior', currentPage)
                           : Container(),
                           _buttonPage('Siguiente', currentPage)
                          ]
            ),
     ),
   );

 }
Widget _buttonPage(String titulo,int currentPage){

      return OutlineButton(
             child: Text(titulo),
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
             borderSide: BorderSide(color:Colors.green),
             onPressed:(){
                context.bloc<ZoologicoBloc>().add(
                  ChangePageEvent(page: currentPage,action: titulo)
                );
                context.bloc<ZoologicoBloc>().add(
                  VerificarEjercicioEvent(page: currentPage)
                );
                  if(titulo == 'Anterior')
                _lanzarEventos(currentPage - 1);
                  if(titulo == 'Siguiente')
                _lanzarEventos(currentPage + 1);
             },
      );
}

void _lanzarEventos(int page) {
       switch (page) {
                  case 1 : context.bloc<ZoologicoBloc>().add(
                            RandomListAnimalEvent(respuesta: 'Leon'),
                           );
                           break;
                  case 2 : context.bloc<ZoologicoBloc>().add(
                            RandomListAnimalEvent(respuesta: 'Elefante'),
                           );
                           break;
                  case 4 : context.bloc<ZoologicoBloc>().add(
                            TranformTarjetaTextoEvent()
                           );
                           break;
                  default: break;
   }

  }

}

