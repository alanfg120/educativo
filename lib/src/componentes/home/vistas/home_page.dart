import 'dart:math';
import 'package:educativo/src/componentes/colorincolorado/bloc/colorincolorado_bloc.dart';
import 'package:educativo/src/componentes/comesonidos/bloc/comesonidos_bloc.dart';
import 'package:educativo/src/componentes/home/bloc/home_bloc.dart';
import 'package:educativo/src/componentes/zoologico/bloc/zoologico_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class HomePage extends StatefulWidget {

  static final style = TextStyle(
      fontSize: 35,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w300,
      color: Colors.black);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  bool bloqueado = false;
  UpdateType updateType;
 
 Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return Container(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          BlocBuilder<HomeBloc,HomeState>(
           builder:(context,state)
                  =>LiquidSwipe(
                    pages: <Container>[
                           _itemMenu(
                            bloqueado : state.bloqueoJuego[0],
                            image     : 'assets/comesilabas.png',
                            page      : 0,
                            titulo    : 'Mounstro Comesonido' 
                           ),
                           _itemMenu(
                            bloqueado : state.bloqueoJuego[1],
                            image     : 'assets/zoologico.png',
                            page      : 1,
                            titulo    : 'Zoologico' 
                           ),
                           _itemMenu(
                            bloqueado : state.bloqueoJuego[2],
                            image     : 'assets/colorin.png',
                            page      : 2,
                            titulo    : 'Colorin Colorodado' 
                           ),
                   ],
                  fullTransitionValue: 800,
                  enableSlideIcon: true,
                  enableLoop: true,
                  positionSlideIcon: 0.5,
                  onPageChangeCallback: pageChangeCallback,
                  currentUpdateTypeCallback: updateTypeCallback,
                  waveType: WaveType.liquidReveal,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(3, _buildDot),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    print(lpage);
    setState(() {
      page = lpage;
    });
  }

  updateTypeCallback(UpdateType updateType) {
    print(updateType);
  }

  Widget _itemMenu({String titulo,bool bloqueado,int page,String image}) {
   return Container(
          padding   : EdgeInsets.only(bottom: 40),
          alignment : Alignment.centerRight,
          child     : SizedBox(
                      width  : 400,
                      height : 400,
                      child  : Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: <Widget>[
                                          Text(titulo, style: HomePage.style),
                                          _progress(page),
                                          _button(bloqueado,page),
                                          
                                  ],
                      ),
          ),
  decoration: BoxDecoration(
              image: DecorationImage(
                     image : AssetImage(image), 
                     fit   : BoxFit.cover
              )
  ),
  );
 }

  Widget _button(bool bloqueado, int pagina) {
    return SizedBox(
           width: 200,
           child: RaisedButton(
                  color     : Colors.green,
                  padding   : EdgeInsets.all(15),
                  onPressed : bloqueado ? null : () => _selectPage(pagina),
                  child     : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                         bloqueado 
                                         ? Icon(Icons.lock,color: Colors.white) 
                                         : Icon(Icons.check,color: Colors.white),
                                         Text('Jugar',
                                         style: TextStyle(color: Colors.white,fontSize: 20)
                                         )
                              ]
                  ),
                  shape      : RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(40)
                  ),
           ),
           );
  }

  Widget _barProgress(double progreso, int ejercicios) {
    return Padding(
           padding: EdgeInsets.symmetric(horizontal: 31, vertical: 20),
           child  : Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                              SizedBox(
                              child  : LinearProgressIndicator(
                                       value: progreso,
                                       backgroundColor:Colors.white,
                                       ), 
                              height : 20
                              ),
                              Text('${(progreso * ejercicios).round()} / $ejercicios', style: TextStyle(fontSize: 20))
                    ],
           ),
           );
  }
  
 _selectPage(int page) {
   switch (page) {
          case 0 : Navigator.pushNamed(context, 'comesonidos');     
                   break;  
          case 1 : Navigator.pushNamed(context, 'zoologico');       
                   break;  
          case 2 : Navigator.pushNamed(context, 'colorin');       
                   break;  
          default: break;
   }

  }

// ignore: missing_return
Widget  _progress(int pagina) {
   switch (pagina) {
          case 0 : return BlocConsumer<ComesonidosBloc,ComeSonidosState>(
                          listener: (context,state){
                              if((state.progreso * 10).toInt() == 9)
                                 context.bloc<HomeBloc>().add(
                                  DesbloquearJuegoEvent(index: (pagina+1))
                                 );
                          },
                          builder: (context,state)=>
                                    _barProgress(state.progreso,state.numeroEjercicios)
                                   
                          );
                   break;  
          case 1 : return BlocConsumer<ZoologicoBloc,ZoologicoState>(
                           listener: (context,state){
                              if((state.progreso * 5).toInt() == 5)
                                 context.bloc<HomeBloc>().add(
                                  DesbloquearJuegoEvent(index: (pagina+1))
                                 );
                          },
                          builder: (context,state)=>
                                    _barProgress(state.progreso, state.numeroEjercicios)
                          );     
                   break;  
       
          case 2 : return BlocConsumer<ColorinColoradoBloc,ColorinColoradoState>(
                           listener: (context,state){
                              if((state.progreso * 5).toInt() == 5)
                                 context.bloc<HomeBloc>().add(
                                  DesbloquearJuegoEvent(index: (pagina+1))
                                 );
                          },
                          builder: (context,state)=>
                                    _barProgress(state.progreso, state.numeroEjercicios)
                          );        
                   break;  
          default: break;
   }

  }
} 
