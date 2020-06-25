import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          
          //Menu
          Padding(
          padding:EdgeInsets.all(10),
          child: Text("Actividades"),
          ),
          Flexible( flex: 1,
                      child: ListView(
            children: <Widget>[
              ListTile(
              leading: Container(
                padding: EdgeInsets.all(3),
                       height : 90,
                       width  : 90,
                       child: Placeholder(),
              ),
              title: Text("Montruo comesonidos"),
              subtitle: LinearProgressIndicator(value: 0.5
              ),
              isThreeLine: true,
              ),
              ListTile(
              leading: Container(
                padding: EdgeInsets.all(3),
                       height : 90,
                       width  : 90,
                       child: Placeholder(),
              ),
              title: Text("El Zologico"),
              ),
              ListTile(
              leading: Container(
                       padding: EdgeInsets.all(3),
                       height : 90,
                       width  : 90,
                       child: Placeholder(),
              ),
              title: Text("Campo Y Ciudad"),
              ),
              ListTile(
              leading: Container(
                padding: EdgeInsets.all(3),
                       height : 90,
                       width  : 90,
                       child: Placeholder(),
              ),
              title: Text("Cantando voi Rimando"),
              ),
              ListTile(
              leading: Container(
                padding: EdgeInsets.all(3),
                       height : 90,
                       width  : 90,
                       child: Placeholder(),
              ),
              title: Text("Colorin  Colorado"),
              )
            ],
            ),
          )
        ],
      ),
    );
  }
}
