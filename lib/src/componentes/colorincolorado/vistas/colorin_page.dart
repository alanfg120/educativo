 import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:educativo/src/componentes/colorincolorado/bloc/colorincolorado_bloc.dart';
import 'package:educativo/src/componentes/colorincolorado/widgets/grabar_audio_widget.dart';
import 'package:educativo/src/componentes/colorincolorado/widgets/opciones_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void audioPlayerHandler(AudioPlayerState value) => print('state => $value');

class ColorinColoradoPage extends StatefulWidget {
  @override
  _ColorinColoradoPageState createState() => _ColorinColoradoPageState();
}

class _ColorinColoradoPageState extends State<ColorinColoradoPage> {
  
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
  Widget build(BuildContext context) {
    return BlocBuilder<ColorinColoradoBloc,ColorinColoradoState>(
           builder: (context,state)=>
                    Scaffold (
                    body: SafeArea(
                          child: Stack(
                                 children: <Widget>[
                                           Positioned(
                                           child: IconButton(
                                                  icon      : Icon(Icons.arrow_back_ios), 
                                                  onPressed : ()=>Navigator.pop(context)
                                                  )
                                           ),
                                           Padding(
                                           padding : EdgeInsets.only(top:20),
                                           child   : AnimatedSwitcher(
                                                     duration : Duration(milliseconds: 500),
                                                     child    : IndexedStack(
                                                                key      : ValueKey<int>(state.currentPage),
                                                                index    : state.currentPage,
                                                                children : <Widget>[
                                                                          OpcionesCuentoPage(
                                                                          audio      : _audioCache,
                                                                          pathAudio  : 'audios/rugido.mp3',
                                                                          titulo     : 'Escoje tu personaje principal',
                                                                          opciones   : state.personajesPrincipales,
                                                                          radioValue : state.radioPersonajePrincipal,
                                                                          ),
                                                                          OpcionesCuentoPage(
                                                                          audio      : _audioCache,
                                                                          pathAudio  : 'audios/rugido.mp3',
                                                                          titulo     : 'Escoje tu personaje secundario',
                                                                          opciones   : state.personajesSecundarios,
                                                                          radioValue : state.radioPersonajeSecundario
                                                                          ),
                                                                          OpcionesCuentoPage(
                                                                          audio      : _audioCache,
                                                                          pathAudio  : 'audios/rugido.mp3',
                                                                          titulo     : 'Escoje el ecenario del cuento',
                                                                          opciones   : state.ecenarios,
                                                                          radioValue : state.radioEcenarios
                                                                          ),
                                                                          OpcionesCuentoPage(
                                                                          audio      : _audioCache,
                                                                          pathAudio  : 'audios/rugido.mp3',
                                                                          titulo     : 'Escoje un objeto',
                                                                          opciones   : state.objetosOpciones,
                                                                          radioValue : state.radioObjetos
                                                                          ),
                                                                          OpcionesCuentoPage(
                                                                          audio      : _audioCache,
                                                                          pathAudio  : 'audios/rugido.mp3',
                                                                          titulo     : 'Escoje un medio de transporte',
                                                                          opciones   : state.mediosTransportes,
                                                                          radioValue : state.radioMedioTransporte
                                                                          ),
                                                                 
                                                                         
                                                                ],
                                                     ),
                                           ),
                                           )
                                 ],
                          ),
                    ),
                    bottomSheet: _changePage(state.currentPage),
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
                context.bloc<ColorinColoradoBloc>().add(
                  ChangePageEvent(page: currentPage,action: titulo)
                );
               },
      );
}
}

