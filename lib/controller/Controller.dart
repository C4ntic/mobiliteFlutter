import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchMovie() async {
  const String apikey = '999c41c5';
  final response = await http
      .get(Uri.parse('https://www.omdbapi.com/?i=tt0086190&apikey=$apikey'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}