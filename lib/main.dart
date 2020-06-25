import 'package:educativo/src/componentes/home/bloc/home_bloc.dart';
import 'package:educativo/src/componentes/home/vistas/home_page.dart';
import 'package:educativo/src/plugins/bloc_delgate.dart';
import 'package:educativo/src/plugins/rutas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';


import 'package:path_provider/path_provider.dart';




void main() async {

 WidgetsFlutterBinding.ensureInitialized();
 BlocSupervisor.delegate = SimpleBlocDelegate();
 final  directorio = await getApplicationDocumentsDirectory();
 Hive.init(directorio.path);
/*  Box<Usuario> usuarioBox = await Hive.openBox<Usuario>('usuario');
 usuarioBox.clear(); */


 runApp(MyApp());

}

class MyApp extends StatelessWidget {

 

   final  colorPrimary   = Color(0xFF01C6BD);
   final  colorSecundary = Color(0XFFE4097F);   

  
 
 
  @override
  Widget build(BuildContext context) {
     
 

    return MultiBlocProvider (
          providers: [
                    
                      BlocProvider<HomeBloc>(
                      create: (context) => HomeBloc(),
                      ),
                    
                     

                     ],
          child: MaterialApp(
        
          debugShowCheckedModeBanner: false,
          title: 'Hospital Citas',
          theme: ThemeData(
                 primaryColor  : Color(0xFF01C6BD),
                 appBarTheme   : AppBarTheme(
                                 elevation  : 0.0, 
                                 color      : colorPrimary,
                                 brightness : Brightness.dark,
                                 //iconTheme  : IconThemeData(color:Colors.teal), 
                                 textTheme  : TextTheme(title : TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 25.0,
                                                                //fontFamily: 'Alata'
                                                                ))
                                 ),
               
          ),
          home   : HomePage(),
          routes : route(),
          //initialRoute: 'login',
          ),
    );
  }
}
