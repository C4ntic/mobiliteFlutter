import 'package:flutter/material.dart';

import 'controller/Controller.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _FilmState();
}

class _FilmState extends State<Result> {
  late bool isInitialized;
  late Map<String, dynamic> mapSearch;
  late String search;

  @override
  void initState() {
    super.initState();
    isInitialized = false;
    search = "Star";
    getMap(search);
  }

  void getMap(search) async {
    mapSearch = await fetchSearch(search);
    isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result of : $search"),
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
                  for (var i = 0; i < mapSearch["Search"].length; i++)
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/film');
                          },
                          child: Text(mapSearch["Search"][i]["Title"])),
                    ),
              ])),
    );
  }
}
