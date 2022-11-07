import 'package:flutter/material.dart';
import 'film.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Film(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder> {
        '/film': (BuildContext context) => Film(title: '[Titre film]'),
      },
    );
  }
}




