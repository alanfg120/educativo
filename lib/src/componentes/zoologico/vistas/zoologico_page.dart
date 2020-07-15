import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:educativo/src/componentes/zoologico/widgets/cuarto_ejercicio.dart';
import 'package:educativo/src/componentes/zoologico/widgets/primer_ejercicio.dart';
import 'package:educativo/src/componentes/zoologico/widgets/quinto_ejercicio.dart';
import 'package:educativo/src/componentes/zoologico/widgets/segundo_ejercicio.dart';
import 'package:educativo/src/componentes/zoologico/widgets/tercer_ejercicio.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void audioPlayerHandler(AudioPlayerState value) => print('state => $value');

class ZoologicoPage extends StatefulWidget {
  @override
  _ZoologicoPageState createState() => _ZoologicoPageState();
}

class _ZoologicoPageState extends State<ZoologicoPage> {

  AudioPlayer _audioPlayer = AudioPlayer();
  AudioCache  _audioCache   = AudioCache();
  PageController _controller;
  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      _audioPlayer.monitorNotificationStateChanges(audioPlayerHandler);
    }
    _controller = PageController(
     initialPage: 0,
    );
  // _audioCache.play('audios/leon.mp3');
  }
   @override
  void dispose() {
    super.dispose();

  }
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar : AppBar(title: Text("El Zoologico")),
      body   : PageView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                PrimerEjercicioZoologico(audio: _audioCache),
                SegundoEjercicioZoologico(audio: _audioCache),
                TercerEjercicioZoologico(audio: _audioCache,),
                CuartoEjercicioZoologico(),
                QuintoEjercicioZoologico()
                
              ],
      ),
       bottomSheet: _changePage()
       
      );
  }

 Widget _changePage() {
   return SafeArea(
          child: Container(
                 height : 90,
                 child  : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                              RaisedButton(
                              onPressed:(){
                                setState(() {
                                  _controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                                });
                              },
                              child: Text("Anterior"),
                              ),
                              RaisedButton(
                              onPressed:(){
                                 setState(()   {
                                   _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                                 });
                              },
                              child: Text("Siguiente"),
                              ),
                          ],
            ),
     ),
   );

 }

}

