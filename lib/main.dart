import 'package:flutter/material.dart';
import 'package:mobiliteflutter/search.dart';
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
      home: const Search(),
      routes: <String, WidgetBuilder> {
        '/film': (BuildContext context) => const Film(),
        '/search': (BuildContext context) => const Search(),
      },
    );
  }
}




