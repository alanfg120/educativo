import 'package:educativo/src/componentes/campoyciudad/bloc/campoyciudad_bloc.dart';
import 'package:educativo/src/componentes/cantando/bloc/cantando_bloc.dart';
import 'package:educativo/src/componentes/comesonidos/bloc/comesonidos_bloc.dart';
import 'package:educativo/src/componentes/zoologico/bloc/zoologico_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List menu = [
    'Mounstro Comesonidos',
    'El Zoologico',
    'Campo y Ciudad',
    'Cantando voi Rimando',
    'Colorin Colorado'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Header
          Flexible(
            flex: 1,
            child: SafeArea(
              child: PageView(
                children: <Widget>[
                  Placeholder(color: Colors.red),
                  Placeholder(color: Colors.blue),
                  Placeholder(color: Colors.yellow),
                  Placeholder(color: Colors.purple),
                  Placeholder(color: Colors.teal),
                ],
              ),
            ),
          ),

          //Menuƒ
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("Actividades"),
          ),
          Flexible(
          flex  : 1,
          child : ListView.builder(
                  itemCount   : menu.length, 
                  itemBuilder : (context, i) {
                    return ListTile(
                           leading  : _imageMenu(),
                           title    : Text(menu[i]),
                           subtitle : _progress(i),
                           onTap    : ()=>_selectPage(i)
                    );
                  }
          ),
          )
        ],
      ),
    );
  }

 Widget _imageMenu() {
       return Container(
              width  : 90,
              height : 90,
              child  : Placeholder(),
       );
 }

  _selectPage(int i) {
   switch (i) {
          case 0 : Navigator.pushNamed(context, 'comesonidos');     
                   break;  
          case 1 : Navigator.pushNamed(context, 'zoologico');       
                   break;  
          case 2 : Navigator.pushNamed(context, 'campo');       
                   break;  
          case 3 : Navigator.pushNamed(context, 'cantando');      
                   break;  
          case 4 : Navigator.pushNamed(context, 'colorin');         
                   break;  
          default: break;
   }

  }
Widget  _progress(int i) {
   switch (i) {
          case 0 : return BlocBuilder<ComesonidosBloc,ComeSonidosState>(
                          builder: (context,state)=>
                                    LinearProgressIndicator(value:state.progreso)
                          );
                   break;  
          case 1 : return BlocBuilder<ZoologicoBloc,ZoologicoState>(
                          builder: (context,state)=>
                                    LinearProgressIndicator()
                          );     
                   break;  
          case 2 : return BlocBuilder<CampoyCiudadBloc,CampoyCiudadState>(
                          builder: (context,state)=>
                                    LinearProgressIndicator()
                          );        
                   break;  
          case 3 : return BlocBuilder<CantandoBloc,CantandoState>(
                          builder: (context,state)=>
                                    LinearProgressIndicator()
                          );       
                   break;  
          case 4 : return LinearProgressIndicator();       
                   break;  
          default: break;
   }

  }
}
