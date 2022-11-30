import 'package:flutter/material.dart';

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
            this.value = value;
            Navigator.pushNamed(context, '/result', arguments: this.value);
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
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18
              ),
              prefixIcon: Container(
                padding: const EdgeInsets.all(15),
                width: 18,
                child: Image.asset('assets/icons/search.png'),
              )
          ),
        ),),
    );
  }
}
