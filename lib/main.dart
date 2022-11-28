import 'package:flutter/material.dart';
import 'search.dart';
import 'film.dart';
import 'result.dart';

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
        '/result': (BuildContext context) => const Result(),
      },
    );
  }
}




