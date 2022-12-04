import 'package:flutter/material.dart';
import 'controller/Controller.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late bool isInitialized;
  late Map<String, dynamic> mapSearch;
  late String search;

  @override
  void initState() {
    super.initState();
    isInitialized = false;
  }

  void getMap(search) async {
    mapSearch = await fetchSearch(search);
    setState(() {
      isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final search = ModalRoute.of(context)!.settings.arguments.toString();
    getMap(search);
    return Scaffold(
      appBar: AppBar(
        title: Text("Résulat de : $search"),
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
                            Navigator.pushNamed(context, '/film',
                                arguments: mapSearch["Search"][i]["imdbID"]);
                          },
                          child: Text(mapSearch["Search"][i]["Title"])),
                    ),
              ])),
    );
  }
}
