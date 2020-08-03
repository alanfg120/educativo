import 'package:educativo/src/componentes/comesonidos/bloc/comesonidos_bloc.dart';
import 'package:educativo/src/componentes/comesonidos/widgets/ejercicio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComeSonidosPage extends StatefulWidget {
  @override
  _ComeSonidosPageState createState() => _ComeSonidosPageState();
}

class _ComeSonidosPageState extends State<ComeSonidosPage> {
  
  PageController _controller = PageController(keepPage: false);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = context.bloc<ComesonidosBloc>().state.currentpage;
    return Scaffold(
            body  : BlocConsumer<ComesonidosBloc,ComeSonidosState>(
                listener: (context,state){
                /*     if(state.progreso > 0 && state.progreso < 0.9999)
                       _controller.nextPage(
                                   duration : Duration(milliseconds: 800), 
                                   curve    : Curves.linearToEaseOut
                       ); */
                    
                },

                builder:(context,state)
                        =>SafeArea(
                          child: Stack(
                                  children:<Widget>[ 
                                    Positioned(
                                    child: IconButton(
                                           icon: Icon(Icons.arrow_back_ios), 
                                           onPressed: ()=>Navigator.pop(context)
                                           )
                                    ),
                                    AnimatedSwitcher(
                                    duration: Duration(milliseconds: 200),
                                    child: IndexedStack(
                                           key: ValueKey<int>(state.currentpage),
                                           index: state.currentpage,
                                           children: <Widget>[
                                                  EjercicioComeSonido(
                                                  image     : 'assets/mesa.jpg',
                                                  data      :  state.ejercicios['ejercicio1'],
                                                  ejercicio : 'ejercicio1',
                                                  ),                    
                                                  EjercicioComeSonido(
                                                  image     : 'assets/sapo.png',
                                                  data      :  state.ejercicios['ejercicio2'],
                                                  ejercicio : 'ejercicio2',
                                                  ),                    
                                                  EjercicioComeSonido(
                                                  image     : 'assets/momia.jpg',
                                                  data      :  state.ejercicios['ejercicio3'],
                                                  ejercicio : 'ejercicio3',
                                                  ),                    
                                                  EjercicioComeSonido(
                                                  image     : 'assets/mama.jpg',
                                                  data      :  state.ejercicios['ejercicio4'],
                                                  ejercicio : 'ejercicio4',
                                                  ),                    
                                                  EjercicioComeSonido(
                                                  image     : 'assets/paloma.jpg',
                                                  data      :  state.ejercicios['ejercicio5'],
                                                  ejercicio : 'ejercicio5',
                                                  ),                    
                                                  EjercicioComeSonido(
                                                  image     : 'assets/paloma.jpg',
                                                  data      :  state.ejercicios['ejercicio6'],
                                                  ejercicio : 'ejercicio6',
                                                  ),                    
                                                  EjercicioComeSonido(
                                                  image     : 'assets/paloma.jpg',
                                                  data      :  state.ejercicios['ejercicio7'],
                                                  ejercicio : 'ejercicio7',
                                                  ),                    
                                                  EjercicioComeSonido(
                                                  image     : 'assets/paloma.jpg',
                                                  data      :  state.ejercicios['ejercicio8'],
                                                  ejercicio : 'ejercicio8',
                                                  ),                    
                                                  EjercicioComeSonido(
                                                  image     : 'assets/paloma.jpg',
                                                  data      :  state.ejercicios['ejercicio9'],
                                                  ejercicio : 'ejercicio9',
                                                  ),                    
                                                  EjercicioComeSonido(
                                                  image     : 'assets/paloma.jpg',
                                                  data      :  state.ejercicios['ejercicio10'],
                                                  ejercicio : 'ejercicio10',
                                                  ),                    
                                       ],
                ),
                                    ),
                                                 ]               ),
              ),
    )
    );
  }

  
 }
