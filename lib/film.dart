import 'package:flutter/material.dart';

import 'controller/Controller.dart';

class Film extends StatefulWidget {
  const Film({super.key});

  @override
  State<Film> createState() => _FilmState();
}

class _FilmState extends State<Film> {
  late bool isInitialized;
  late Map<String, dynamic> mapMovie;
  late String id;

  @override
  void initState() {
    super.initState();
    isInitialized = false;
  }

  void getMap(id) async {
    mapMovie = await fetchMovie(id);
    setState(() {
      isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments.toString();
    getMap(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(mapMovie['Title']),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFF2C393F),
      body: Container(
          alignment: Alignment.topCenter,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!isInitialized)
                  const Center(child: CircularProgressIndicator())
                else
                  Column(children: <Widget>[
                    Text(mapMovie["Title"],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(mapMovie["Year"],
                            style: const TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.bold))),
                    Image.network(mapMovie["Poster"]),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(mapMovie["Plot"],
                            style: const TextStyle(color: Colors.white70)))
                  ]),
              ])),
    );
  }
}
