import 'package:flutter/material.dart';
import 'controller/Controller.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Recherche');
  String value = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFF2C393F),
      body: Container(
        alignment: Alignment.topCenter,
        child: TextField(
          onSubmitted: (String value) async {
            print("$value");
            this.value = "$value";
            print('la valeur de nahelbok est : ' + this.value);
            // Navigator.pop();
          },
          cursorColor: Colors.grey,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 18
              ),
              prefixIcon: Container(
                padding: EdgeInsets.all(15),
                child: Image.asset('assets/icons/search.png'),
                width: 18,
              )
          ),
        ),),
    );
  }
}
