import 'package:flutter/material.dart';


class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(
          
          image: new DecorationImage(
              image: new NetworkImage(
                  'https://tdah.org.br/wp-content/uploads/ajustes-1280x640.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(255, 255, 255, 0.8), BlendMode.modulate)),
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://raw.githubusercontent.com/ebasantos/estoque-web-app-front-end/master/src/img/logo_ufmt.png'
              ,fit: BoxFit.scaleDown,
              color: Color.fromRGBO(0, 0  , 0, 1),
            ),
            Text("Bem vindo..."),
          ],
        ),
      );
  }
}