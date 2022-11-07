class Movie {
 String title;
 int year;
 String imdbID;
 String poster;

  Movie({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.poster
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      year: json['Year'],
      imdbID: json['imdbID'],
      poster: json['Poster']
    );
  }
}