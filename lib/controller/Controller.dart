import 'dart:convert';

import 'package:http/http.dart' as http;

String getApikey(){
  return '999c41c5'; //Mettre son apikey ici
}

Future<Map<String, dynamic>> fetchMovie(id) async {
  final response = await http
      .get(Uri.parse('https://www.omdbapi.com/?i=$id&apikey=${getApikey()}'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<Map<String, dynamic>> fetchSearch(s) async {
  final response = await http
      .get(Uri.parse('https://www.omdbapi.com/?s=$s&apikey=${getApikey()}'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}