import 'package:screenwave/vo/movie.dart';

class Category {
  String header;
  int totalItems;
  List<Movie> movies;

  factory Category.fromMapForTrending(Map<String, dynamic> map) {
    List<dynamic> list = map['results'] ?? [];
    List<Movie> movies = list.map((r) => Movie.fromMapForTrending(r)).toList();

    return Category(
        header: map['heading'] ?? "",
        totalItems: map['total_items'] ?? 0,
        movies: movies);
  }

  factory Category.fromMapForScreening(Map<String, dynamic> map) {
    List<dynamic> list = map['results'] ?? [];
    List<Movie> movies = list.map((r) => Movie.fromMapForScreening(r)).toList();

    return Category(
        header: map['heading'] ?? "",
        totalItems: map['total_items'] ?? 0,
        movies: movies);
  }

  Category(
      {required this.header, required this.totalItems, required this.movies});
}
