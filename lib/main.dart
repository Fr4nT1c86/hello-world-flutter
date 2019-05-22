import 'package:flutter/material.dart';
import 'package:Alunos_mobile/pages/template.dart';

void main() {
  runApp(new SelfStockApp());
}

class SelfStockApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Alunos PAW II',
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        primaryColor: const Color(0xFF050101),
        accentColor: const Color(0xFFffffff),
        canvasColor: const Color(0xFFf4f4f4),
        fontFamily: 'Merriweather',
      ),
      home: new Template(),
    );
  }
}
