import 'package:audioplayers/audio_cache.dart';
import 'package:educativo/src/componentes/zoologico/bloc/zoologico_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PrimerEjercicioZoologico extends StatefulWidget {
  final AudioCache audio;
  PrimerEjercicioZoologico({this.audio});
  @override
  _PrimerEjercicioZoologicoState createState() => _PrimerEjercicioZoologicoState();
}

class _PrimerEjercicioZoologicoState extends State<PrimerEjercicioZoologico> {

   
   YoutubePlayerController _controller = YoutubePlayerController(
                                         initialVideoId: 'OTaOGoyE2Wg',
                                         flags: YoutubePlayerFlags(
                                                autoPlay     : false,
                                                mute         : false,
                                                hideControls : false,
                                                loop         : true
                                         ),
   );
  @override
  Widget build(BuildContext context) {
    return  Column(
               children:<Widget>[
                _youtubeVideo(),
                Padding(
                padding : const EdgeInsets.all(18.0),
                child   : Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: <Widget>[
                                    Text("Seleciona el animal que mas te gusta",style: TextStyle(fontSize: 15)),
                                    GestureDetector(
                                    onTap: ()=>widget.audio.play('audios/animalFavorito.mp3'),
                                    child: Image.asset(
                                           'assets/sonido.png',
                                            width  : 45,
                                            height : 45,
                                    ),
                                    )   
                         ],
                ),
                ),
                _listaAnimales()
               ] 
    );

  }
   Widget _youtubeVideo() {
   return YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          aspectRatio: 1.2,
          progressColors: ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
          )
   );
 }

  Widget _listaAnimales() {
       return BlocBuilder<ZoologicoBloc,ZoologicoState>(
              builder:(context,state)=>
       
              Expanded(
              child: GridView.builder(
                     padding      : EdgeInsets.only(bottom: 80),
                     itemCount    : state.animales.length,
                     gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                     itemBuilder  : (context, i) => Column(
                                                  children: <Widget>[
                                                      Image.asset(
                                                      state.animales[i].image,
                                                      width  : 50,
                                                      height : 50,
                                                      fit    : BoxFit.contain,
                                                      ),
                                                      Checkbox(
                                                      value: state.animales[i].selecionado, 
                                                      onChanged: (value){
                                                      setState(() =>
                                                            context.bloc<ZoologicoBloc>().add(
                                                              SelectAnimalEvent(index: i,select: value)
                                                            )
                                                          );
                                                      }
                                                      )
                                                  ],
                     ),
                     
              ),
       )
       );

  }
}