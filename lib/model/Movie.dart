import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Movie> fetchMovie() async {
  final response = await http
      .get(Uri.parse('https://www.omdbapi.com/?i=tt0086190&apikey=999c41c5'));

  if (response.statusCode == 200) {
    return Movie.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class Movie {
  String title;
  int year;
  String imdbID;
  String poster;

  Movie(
      {required this.title,
      required this.year,
      required this.imdbID,
      required this.poster});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['Title'],
        year: json['Year'],
        imdbID: json['imdbID'],
        poster: json['Poster']);
  }
}
