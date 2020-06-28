import 'package:educativo/src/componentes/comesonidos/bloc/comesonidos_bloc.dart';
import 'package:educativo/src/componentes/comesonidos/widgets/ejercicio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComeSonidosPage extends StatefulWidget {
  @override
  _ComeSonidosPageState createState() => _ComeSonidosPageState();
}

class _ComeSonidosPageState extends State<ComeSonidosPage> {
  bool isSuccessful= true;
  PageController _controller = PageController(
    initialPage: 0,
    keepPage: true
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(title: Text('Monstro Comesonido')),
              body  : BlocBuilder<ComesonidosBloc,ComeSonidosState>(
                builder:(context,state)
                        =>PageView(
                          controller: _controller,
                          //physics: NeverScrollableScrollPhysics(),
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
    );
  }

  
 }
