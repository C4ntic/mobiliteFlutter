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
    id = "tt0086190";
    getMap(id);
  }

  void getMap(id) async {
    mapMovie = await fetchMovie(id);
    isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informations Film"),
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
